/*
 * generated by Xtext 2.12.0
 */
package de.fhdo.lemma.data.validation

import org.eclipse.xtext.validation.Check
import de.fhdo.lemma.data.ComplexTypeImport
import org.eclipse.xtext.EcoreUtil2
import de.fhdo.lemma.data.DataModel
import de.fhdo.lemma.data.DataPackage
import de.fhdo.lemma.data.DataStructure
import de.fhdo.lemma.data.DataField
import org.eclipse.xtext.naming.QualifiedName
import de.fhdo.lemma.data.Version
import com.google.common.base.Function
import java.util.List
import org.eclipse.emf.ecore.resource.Resource
import de.fhdo.lemma.utils.LemmaUtils
import de.fhdo.lemma.data.DataFieldFeature
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EStructuralFeature
import de.fhdo.lemma.data.Context
import de.fhdo.lemma.data.DataOperation
import de.fhdo.lemma.data.DataStructureFeature
import de.fhdo.lemma.data.DataOperationFeature
import de.fhdo.lemma.data.PrimitiveType
import de.fhdo.lemma.data.Type
import de.fhdo.lemma.data.ListType
import de.fhdo.lemma.data.Enumeration
import de.fhdo.lemma.data.PrimitiveTypeConstants

/**
 * This class contains validation rules for the Data DSL.
 *
 * 
 */
class DataDslValidator extends AbstractDataDslValidator {
    /* For debugging purposes to test the type checker. May be safely removed in the future. */
    /*@Check
    def checkAssignTest(AssignTest assignTest) {
        try {
            new TypeChecker().checkTypeCompatibility(assignTest.target.complexType,
                assignTest.source.complexType)
        } catch (TypesNotCompatibleException ex) {
            warning(ex.message, assignTest, DataPackage::Literals.ASSIGN_TEST__SOURCE)
        }
    }*/

    /**
     * Check import aliases for uniqueness. Normally, this should be done by
     * DataDslNamesAreUniqueValidationHelper, but it does not react to
     */
    @Check
    def checkImportAlias(DataModel dataModel) {
        val duplicateIndex = LemmaUtils.getDuplicateIndex(dataModel.complexTypeImports, [name])
        if (duplicateIndex === -1) {
            return
        }

        val duplicate = dataModel.complexTypeImports.get(duplicateIndex)
        error('''Duplicate import alias «duplicate.name»''', duplicate,
            DataPackage::Literals.COMPLEX_TYPE_IMPORT__NAME)
    }

    /**
     * Check that imported file is imported exactly once
     */
    @Check
    def checkImportFileUniqueness(DataModel dataModel) {
        val duplicateIndex = LemmaUtils.getDuplicateIndex(dataModel.complexTypeImports, [importURI])
        if (duplicateIndex === -1) {
            return
        }

        val duplicate = dataModel.complexTypeImports.get(duplicateIndex)
        error("File is already being imported", duplicate,
            DataPackage::Literals.COMPLEX_TYPE_IMPORT__IMPORT_URI)
    }

    /**
     * Check that imported file defines a data model
     */
    @Check
    def checkImportType(ComplexTypeImport complexTypeImport) {
        if (!LemmaUtils.isImportOfType(complexTypeImport.eResource, complexTypeImport.importURI,
            DataModel))
            error("File does not contain a data model definition", complexTypeImport,
                DataPackage::Literals.COMPLEX_TYPE_IMPORT__IMPORT_URI)
    }

    /**
     * Check versions for unique names
     */
    @Check
    def checkUniqueVersionNames(DataModel dataModel) {
        checkUniqueNames(dataModel.versions, "version", [name], [name],
            DataPackage::Literals.VERSION__NAME)
    }

    /**
     * Check top-level contexts for unique names
     */
    @Check
    def checkUniqueContextNames(DataModel dataModel) {
        checkUniqueNames(dataModel.contexts, "context", [name], [name],
            DataPackage::Literals.CONTEXT__NAME)
    }

    /**
     * Check top-level complex types for unique names
     */
    @Check
    def checkUniqueTypeNames(DataModel dataModel) {
        checkUniqueNames(dataModel.complexTypes, "complex type", [name], [name],
            DataPackage::Literals.COMPLEX_TYPE__NAME)
    }

    /**
     * Check contexts defined in versions for unique names
     */
    @Check
    def checkUniqueContextNames(Version version) {
        checkUniqueNames(version.contexts, "context", [name], [name],
            DataPackage::Literals.CONTEXT__NAME)
    }

    /**
     * Check complex types defined in versions for unique names
     */
    @Check
    def checkUniqueTypeNames(Version version) {
        checkUniqueNames(version.complexTypes, "complex type", [name], [name],
            DataPackage::Literals.COMPLEX_TYPE__NAME)
    }

    /**
     * Check complex types defined in contexts for unique names
     */
    @Check
    def checkUniqueTypeNames(Context context) {
        checkUniqueNames(context.complexTypes, "complex type", [name], [name],
            DataPackage::Literals.COMPLEX_TYPE__NAME)
    }

    /**
     * Check operation parameters for unique names
     */
    @Check
    def checkUniqueParameterNames(DataOperation operation) {
        checkUniqueNames(operation.parameters, "parameter", [name], [name],
            DataPackage::Literals.DATA_OPERATION_PARAMETER__NAME)
    }

    /**
     * Generic helper to check a list of EObjects for unique names
     */
    private def <T extends EObject> checkUniqueNames(
        List<T> objectsToCheck,
        String objectKind,
        Function<T, Object> getCompareValue,
        Function<T, String> getDuplicateOutputString,
        EStructuralFeature feature
    ) {
        val duplicateIndex = LemmaUtils.getDuplicateIndex(objectsToCheck, getCompareValue)
        if (duplicateIndex === -1) {
            return
        }

        val duplicate = objectsToCheck.get(duplicateIndex)
        error('''Duplicate «objectKind» «getDuplicateOutputString.apply(duplicate)»''', duplicate,
            feature)
    }

    /**
     * Check data structure for unique names
     */
    @Check
    def checkUniqueNames(DataStructure dataStructure) {
        val dataFieldCount = dataStructure.dataFields.size
        val uniqueNames = <String>newArrayList
        uniqueNames.addAll(dataStructure.dataFields.map[it.name])
        uniqueNames.addAll(dataStructure.operations.map[it.name])
        val duplicateIndex = LemmaUtils.getDuplicateIndex(uniqueNames, [it])
        if (duplicateIndex > -1) {
            val isOperation = duplicateIndex >= dataFieldCount
            if (!isOperation)
                error("Duplicate structure component",
                    DataPackage::Literals.DATA_STRUCTURE__DATA_FIELDS, duplicateIndex)
            else {
                val operationIndex = duplicateIndex - dataFieldCount
                error("Duplicate structure component",
                    DataPackage::Literals.DATA_STRUCTURE__OPERATIONS, operationIndex)
            }
        }
    }

    /**
     * Check data structure for unique features
     */
    @Check
    def checkUniqueFeatures(DataStructure dataStructure) {
        val duplicateIndex = LemmaUtils.getDuplicateIndex(dataStructure.features, [it])
        if (duplicateIndex > -1)
            error("Duplicate feature", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, duplicateIndex)
    }

    /**
     * Check "aggregate" feature constraints
     */
    @Check
    def checkAggregateFeatureConstraints(DataStructure dataStructure) {
        val featureIndex = dataStructure.features.indexOf(DataStructureFeature.AGGREGATE)
        if (featureIndex === -1) {
            return
        }

        // Only entities should be aggregates
        if (!dataStructure.hasFeature(DataStructureFeature.ENTITY))
            warning("Only entities should be aggregates", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)

        // The aggregate should contain at least one part
        val effectiveDataFieldFeatures = dataStructure.effectiveFields.map[features].flatten
        if (!effectiveDataFieldFeatures.exists[it == DataFieldFeature.PART])
            warning("Aggregate should contain at least one part", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)
    }

    /**
     * Check "applicationService" feature constraints
     */
    @Check
    def checkApplicationServiceFeatureConstraints(DataStructure dataStructure) {
        checkServiceFeatureConstraints(dataStructure, DataStructureFeature.APPLICATION_SERVICE)
    }

    /**
     * Generic helper to check constraints of a certain peculiarity of the "service" feature
     */
    def checkServiceFeatureConstraints(DataStructure dataStructure,
        DataStructureFeature serviceFeature) {
        val featureIndex = dataStructure.features.indexOf(serviceFeature)
        if (featureIndex === -1) {
            return
        }

        // No other domain features should exist on the structure
        if (dataStructure.hasAdditionalDomainFeatures(serviceFeature))
            warning("A service should not exhibit other domain features", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)

        // Service should only comprise operations
        if (!dataStructure.effectiveFields.empty)
            warning("A service should only comprise operations", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)

        // Service should comprise at least one operation
        if (dataStructure.effectiveOperations.empty)
            warning("A service should comprise at least one operation", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)
    }

    /**
     * Helper to check if a data structure has also other domain-driven-design-related features than
     * a given one
     */
    private def hasAdditionalDomainFeatures(DataStructure structure, DataStructureFeature feature) {
        val domainFeaturesOnStructure = structure.features
            .filter[structure.allDomainFeatures.contains(it)]
        return domainFeaturesOnStructure.size > 1 ||
            !domainFeaturesOnStructure.exists[it == feature]
    }

    /**
     * Check "domainEvent" feature constraints
     */
    @Check
    def checkDomainEventFeatureConstraints(DataStructure dataStructure) {
        val featureIndex = dataStructure.features.indexOf(DataStructureFeature.DOMAIN_EVENT)
        if (featureIndex === -1) {
            return
        }

        // Only value objects should be domain events
        if (!dataStructure.hasFeature(DataStructureFeature.VALUE_OBJECT))
            warning("Only value objects should be domain events", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)
    }

    /**
     * Check "domainService" feature constraints
     */
    @Check
    def checkDomainServiceFeatureConstraints(DataStructure dataStructure) {
        checkServiceFeatureConstraints(dataStructure, DataStructureFeature.DOMAIN_SERVICE)
    }

    /**
     * Check "entity" feature constraints
     */
    @Check
    def checkEntityFeatureConstraints(DataStructure dataStructure) {
        val featureIndex = dataStructure.features.indexOf(DataStructureFeature.ENTITY)
        if (featureIndex === -1) {
            return
        }

        // At least one local, i.e., non-inherited, field or operation should be an identifier
        val dataFieldFeatures = dataStructure.dataFields.map[features].flatten
        val identifierOperations = dataStructure.operations
            .map[features].flatten
            .filter[it == DataOperationFeature.IDENTIFIER]
        val hasIdentifierFields = dataFieldFeatures.exists[it == DataFieldFeature.IDENTIFIER]
        val hasIdentifierOperations = !identifierOperations.empty

        if (!hasIdentifierFields && !hasIdentifierOperations)
            warning("At least one non-inherited field or operation should be an identifier for " +
                "the entity", dataStructure, DataPackage::Literals.DATA_STRUCTURE__FEATURES,
                featureIndex)
        else if (hasIdentifierFields && hasIdentifierOperations)
            warning("Identifier fields and operations should not be mixed", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)

        // Only one operation should be an identifier
        if (identifierOperations.size > 1)
            warning("Only one operation should be an identifier for the entity", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)
    }

    /**
     * Check "factory" feature constraints
     */
    @Check
    def checkFactoryFeatureConstraints(DataStructure dataStructure) {
        val featureIndex = dataStructure.features.indexOf(DataStructureFeature.FACTORY)
        if (featureIndex === -1) {
            return
        }

        // No other domain features should exist on the structure
        if (dataStructure.hasAdditionalDomainFeatures(DataStructureFeature.FACTORY))
            warning("A factory should not exhibit other domain features", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)

        // Factory operations should return complex types being aggregates or value objects
        val hasOperationsWithWrongReturnTypes = dataStructure.effectiveOperations.exists[
            hasNoReturnType ||
            !(
                primitiveOrComplexReturnType instanceof PrimitiveType ||
                primitiveOrComplexReturnType instanceof DataStructure
            ) ||
            {
                if (primitiveOrComplexReturnType instanceof DataStructure) {
                    val dataStructureReturnType = primitiveOrComplexReturnType as DataStructure
                    !dataStructureReturnType.hasFeature(DataStructureFeature.AGGREGATE) &&
                    !dataStructureReturnType.hasFeature(DataStructureFeature.VALUE_OBJECT)
                } else
                    false
            }
        ]

        if (hasOperationsWithWrongReturnTypes)
            warning("Factory operations should return aggregates or value objects", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)
    }

    /**
     * Check "infrastructureService" feature constraints
     */
    @Check
    def checkInfrastructureServiceFeatureConstraints(DataStructure dataStructure) {
        checkServiceFeatureConstraints(dataStructure, DataStructureFeature.INFRASTRUCTURE_SERVICE)
    }

    /**
     * Check "repository" feature constraints
     */
    @Check
    def checkRepositoryFeatureConstraints(DataStructure dataStructure) {
        val featureIndex = dataStructure.features.indexOf(DataStructureFeature.REPOSITORY)
        if (featureIndex === -1) {
            return
        }

        // No other domain features should exist on the structure
        if (dataStructure.hasAdditionalDomainFeatures(DataStructureFeature.REPOSITORY))
            warning("A repository should not exhibit other domain features", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)

        // Repository should comprise at least one operation
        if (dataStructure.effectiveOperations.empty)
            warning("A repository should comprise at least one operation", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)

        // Repository should only handle entities or value objects
        val allDataOperationParameters = dataStructure.effectiveOperations.map[parameters].flatten
        val handlesNotOnlyEntitiesOrValueObjects = allDataOperationParameters.exists[
            return switch(effectiveType) {
                PrimitiveType: false
                DataStructure: {
                    val parameterType = effectiveType as DataStructure
                    !parameterType.hasFeature(DataStructureFeature.ENTITY) &&
                    !parameterType.hasFeature(DataStructureFeature.VALUE_OBJECT)
                }
                default: true
            }
        ]
        if (handlesNotOnlyEntitiesOrValueObjects)
            warning("Complex typed parameters of repository operations should be entities or " +
                "value objects", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)
    }

    /**
     * Check "service" feature constraints
     */
    @Check
    def checkServiceFeatureConstraints(DataStructure dataStructure) {
        checkServiceFeatureConstraints(dataStructure, DataStructureFeature.SERVICE)
    }

    /**
     * Check "specification" feature constraints
     */
    @Check
    def checkSpecificationFeatureConstraints(DataStructure dataStructure) {
        val featureIndex = dataStructure.features.indexOf(DataStructureFeature.SPECIFICATION)
        if (featureIndex === -1) {
            return
        }

        // No other domain features should exist on the structure
        if (dataStructure.hasAdditionalDomainFeatures(DataStructureFeature.SPECIFICATION))
            warning("A specification should not exhibit other domain features", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)

        // A specification should comprise at least one validator operation
        if (!dataStructure.effectiveOperations.exists[hasFeature(DataOperationFeature.VALIDATOR)])
            warning("A specification should comprise at least one validator operation",
                dataStructure, DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)
    }

    /**
     * Check "valueObject" feature constraints
     */
    @Check
    def checkValueObjectFeatureConstraints(DataStructure dataStructure) {
        val featureIndex = dataStructure.features.indexOf(DataStructureFeature.VALUE_OBJECT)
        if (featureIndex === -1) {
            return
        }

        // A value object may not exhibit several other features
        val forbiddenFeatures = #[
            DataStructureFeature.AGGREGATE,
            DataStructureFeature.APPLICATION_SERVICE,
            DataStructureFeature.DOMAIN_SERVICE,
            DataStructureFeature.ENTITY,
            DataStructureFeature.INFRASTRUCTURE_SERVICE,
            DataStructureFeature.REPOSITORY,
            DataStructureFeature.SERVICE,
            DataStructureFeature.SPECIFICATION
        ]

        if (dataStructure.features.exists[forbiddenFeatures.contains(it)])
            warning("A value object should not be an aggregate, entity, repository, service, or " +
                "specification", dataStructure,
                DataPackage::Literals.DATA_STRUCTURE__FEATURES, featureIndex)
    }

    /**
     * Perform checks on data fields
     */
    @Check
    def checkDataField(DataField dataField) {
        /* A data field must either have a type or be hidden */
        if (dataField.effectiveType === null && !dataField.hidden) {
            error("Field must have a type or be hidden", dataField,
                    DataPackage::Literals.DATA_FIELD__NAME)
            return
        }

        /* Check data field initialization */
        if (dataField.initializationValue !== null) {
            // Only primitive data fields are initializable
            if (dataField.primitiveType === null) {
                error("Only primitively typed data fields can be initialized", dataField,
                    DataPackage::Literals.DATA_FIELD__NAME)
                return

            // Only data fields within data structures are initializable
            } else if (dataField.dataStructure === null) {
                error("Only data fields within data structures can be initialized", dataField,
                    DataPackage::Literals.DATA_FIELD__NAME)
                return

            // Type of initialization value must be compatible with data field type
            } else if (!dataField.initializationValue.isOfType(dataField.primitiveType)) {
                error('''Value is not of type «dataField.primitiveType.typeName» ''', dataField,
                    DataPackage::Literals.DATA_FIELD__INITIALIZATION_VALUE)
                return
            }
        }

        /* Hidden immutable, primitively typed fields need an initialization value */
        if (dataField.hidden &&
            dataField.immutable &&
            dataField.primitiveType !== null &&
            dataField.initializationValue === null) {
            error("Hidden immutable fields need to be initialized", dataField,
                    DataPackage::Literals.DATA_FIELD__NAME)
            return
        }

        /* A feature may only be assigned once to a data field */
        val duplicateFeatureIndex = LemmaUtils.getDuplicateIndex(dataField.features, [it])
        if (duplicateFeatureIndex > -1) {
            error("Duplicate feature", dataField,
                DataPackage::Literals.DATA_FIELD__FEATURES, duplicateFeatureIndex)
            return
        }

        /*
         * If there is no equally named super field or the super field is hidden (which means
         * that the complex type does not allow external callers to access it), the field must
         * have a type
         */
        val equalSuperField = dataField.findEponymousSuperField()

        if (equalSuperField === null || equalSuperField.hidden) {
            if (dataField.effectiveType === null)
                error("Field must have a type", dataField, DataPackage::Literals.DATA_FIELD__NAME)

        /*
         * A field with a non-hidden super field (that therefore has a type) may not redefine the
         * super field by having a type, have features, or be immutable
         */
        } else {
            var String superQualifiedName = QualifiedName
                .create(equalSuperField.qualifiedNameParts)
                .toString

            if (dataField.effectiveType !== null)
                error('''Field cannot redefine inherited field «superQualifiedName»''', dataField,
                    DataPackage::Literals.DATA_FIELD__NAME)
            else if (!dataField.features.empty)
                error("Feature assignment is not allowed for inherited fields", dataField,
                    DataPackage::Literals.DATA_FIELD__FEATURES)
            else if (dataField.immutable)
                error("Inherited fields cannot be immutable", dataField,
                    DataPackage::Literals.DATA_FIELD__IMMUTABLE)
        }
    }

    /**
     * Check "part" feature constraints
     */
    @Check
    def checkPartFeatureConstraints(DataField dataField) {
        val featureIndex = dataField.features.indexOf(DataFieldFeature.PART)
        if (featureIndex === -1) {
            return
        }

        if (dataField.dataStructure === null) {
            error('''The "part" feature is only allowed on data structure fields''', dataField,
                DataPackage::Literals.DATA_FIELD__FEATURES, featureIndex)

            return
        }

        if (!(dataField.effectiveType instanceof DataStructure)) {
            error('''Only fields with structural type may exhibit the "part" feature''', dataField,
                DataPackage::Literals.DATA_FIELD__FEATURES, featureIndex)

            return
        }

        // Defining data structure should be aggregate
        if (!dataField.dataStructure.hasFeature(DataStructureFeature.AGGREGATE))
            warning("Parts should only be defined in aggregates", dataField,
                DataPackage::Literals.DATA_FIELD__FEATURES, featureIndex)

        // Only entities and value objects should be parts
        val fieldType = dataField.effectiveType as DataStructure
        if (!fieldType.hasFeature(DataStructureFeature.ENTITY) &&
            !fieldType.hasFeature(DataStructureFeature.VALUE_OBJECT))
            warning("Parts should be entities or value objects", dataField,
                DataPackage::Literals.DATA_FIELD__FEATURES, featureIndex)

        // Part should be in same namespace as aggregate
        val fieldTypeIsImported = dataField.importedComplexType !== null
        if (fieldTypeIsImported ||
            fieldType.closestNamespace != dataField.dataStructure.closestNamespace)
            warning("Parts should be defined in the same namespace as the aggregate", dataField,
                DataPackage::Literals.DATA_FIELD__FEATURES, featureIndex)
    }

    /**
     * Perform checks on data operations
     */
    @Check
    def checkOperation(DataOperation dataOperation) {
        /* Check for unique features */
        val duplicateIndex = LemmaUtils.getDuplicateIndex(dataOperation.features, [it])
        if (duplicateIndex > -1) {
            error("Duplicate feature", dataOperation,
                DataPackage::Literals.DATA_OPERATION__FEATURES, duplicateIndex)
            return
        }

        /* Perform checks related to data structure inheritance */
        val superOperation = dataOperation.findEponymousSuperOperation()
        val superOperationName = if (superOperation !== null)
                QualifiedName.create(superOperation.qualifiedNameParts).toString
            else
                null
        val superOperationIsHidden = superOperation !== null && superOperation.hidden

        val thisIsInherited = superOperation !== null
        val thisIsHidden = dataOperation.hidden

        val redefinitionAttempt = thisIsInherited && !superOperationIsHidden
        val operationTypesDiffer = thisIsInherited &&
            dataOperation.hasNoReturnType != superOperation.hasNoReturnType

        // Inherited operations may not have features
        if (thisIsInherited && !dataOperation.features.empty) {
            error("Feature assignment is not allowed for inherited operations", dataOperation,
                DataPackage::Literals.DATA_OPERATION__FEATURES)
            return
        }

        if (redefinitionAttempt) {
            // In a redefinition attempt, i.e., when the super operation is not hidden, this
            // operation must be hidden
            if (!thisIsHidden) {
                error('''Operation cannot redefine operation «superOperationName» ''',
                        dataOperation, DataPackage::Literals.DATA_OPERATION__NAME)
                return

            // In a redefinition attempt, the operation types of the super and this operation must
            // not differ, i.e., they must be both either procedures or functions
            } else if (operationTypesDiffer) {
                error("Hidden inherited operation must have the same operation type (procedure " +
                    '''or function) as «superOperationName»''', dataOperation,
                    DataPackage::Literals.DATA_OPERATION__NAME)
                return

            // In a redefinition attempt, this operation must be a procedure or function without a
            // return type specification
            } else if (dataOperation.primitiveOrComplexReturnType !== null) {
                error("Hidden inherited operation must not specify a return type", dataOperation,
                    DataPackage::Literals.DATA_OPERATION__NAME)
                return

            // In a redefinition attempt, operations may not specify parameters themselves
            } else if (!dataOperation.parameters.empty) {
                error("Hidden inherited operation must not specify parameters", dataOperation,
                    DataPackage::Literals.DATA_OPERATION__NAME)
                return
            }
        }

        // Operation may only lack a return type specification when it is hidden and inherited
        if (dataOperation.lacksReturnTypeSpecification && (!thisIsHidden || !thisIsInherited))
            error("Operation must have a return type specification or be hidden", dataOperation,
                DataPackage::Literals.DATA_OPERATION__NAME)
    }

    /**
     * Check "closure" feature constraints
     */
    @Check
    def checkClosureFeatureConstraints(DataOperation dataOperation) {
        val featureIndex = dataOperation.features.indexOf(DataOperationFeature.CLOSURE)
        if (featureIndex === -1) {
            return
        }

        // Operation may not be identifier or validator
        if (dataOperation.hasFeature(DataOperationFeature.IDENTIFIER) ||
            dataOperation.hasFeature(DataOperationFeature.VALIDATOR))
            warning("A closure should not be an identifier or validator", dataOperation,
                DataPackage::Literals.DATA_OPERATION__FEATURES, featureIndex)

        // A closure should take exactly one parameter and have a return type
        val hasExactlyOneParameterAndReturnType = dataOperation.parameters.size === 1 &&
            !dataOperation.hasNoReturnType
        if (!hasExactlyOneParameterAndReturnType)
            warning("A closure should take exactly one parameter and have a return type",
                dataOperation, DataPackage::Literals.DATA_OPERATION__FEATURES, featureIndex)

        // A closure should return the same type as it takes
        if (hasExactlyOneParameterAndReturnType) {
            val parameterType = dataOperation.parameters.get(0).effectiveType
            val returnType = dataOperation.primitiveOrComplexReturnType
            if (!returnType.isEquivalent(parameterType))
                warning("A closure should return a value of the same type as its parameter",
                    dataOperation, DataPackage::Literals.DATA_OPERATION__FEATURES, featureIndex)
        }
    }

    /**
     * Helper to check if type1 is equivalent with type2. In this context, equivalence means that
     * type1 is identical to type2, or that it is an extension of type2.
     */
    private def isEquivalent(Type type1, Type type2) {
        return if (type1 instanceof PrimitiveType && type2 instanceof PrimitiveType)
            (type1 as PrimitiveType).typeName == (type2 as PrimitiveType)
        else if (type1 instanceof DataStructure && type2 instanceof DataStructure) {
            val dataStructure1 = (type1 as DataStructure)
            val dataStructure2 = (type2 as DataStructure)
            dataStructure1.buildQualifiedName(".") == dataStructure2.buildQualifiedName(".") ||
            dataStructure1.isExtensionOf(dataStructure2)
        } else if (type1 instanceof ListType && type2 instanceof ListType)
            (type1 as ListType).buildQualifiedName(".") ==
                (type2 as ListType).buildQualifiedName(".")
        else if (type1 instanceof Enumeration && type2 instanceof Enumeration)
            (type1 as Enumeration).name == (type2 as Enumeration).name
        else
            false
    }

    /**
     * Check "sideEffectFree" feature constraints
     */
    @Check
    def checkSideEffectFreeFeatureConstraints(DataOperation dataOperation) {
        val featureIndex = dataOperation.features.indexOf(DataOperationFeature.SIDE_EFFECT_FREE)
        if (featureIndex === -1) {
            return
        }

        // Operation should have a return type
        if (dataOperation.hasNoReturnType)
            warning("A side effect free operation should be a function", dataOperation,
                DataPackage::Literals.DATA_OPERATION__FEATURES, featureIndex)
    }

    /**
     * Check "validator" feature constraints
     */
    @Check
    def checkValidatorFeatureConstraints(DataOperation dataOperation) {
        val featureIndex = dataOperation.features.indexOf(DataOperationFeature.VALIDATOR)
        if (featureIndex === -1) {
            return
        }

        // Defining data structure should be a specification
        if (!dataOperation.dataStructure.hasFeature(DataStructureFeature.SPECIFICATION))
            warning("A validator operation should be defined within a specification", dataOperation,
                DataPackage::Literals.DATA_OPERATION__FEATURES, featureIndex)

        // Operation should have a boolean return type
        if (dataOperation.hasNoReturnType ||
            dataOperation.primitiveReturnType === null ||
            dataOperation.primitiveReturnType.typeName != PrimitiveTypeConstants.BOOLEAN.literal
        )
            warning("A validator operation should return a value of type "+
                '''«PrimitiveTypeConstants.BOOLEAN.literal»''', dataOperation,
                DataPackage::Literals.DATA_OPERATION__FEATURES, featureIndex)
    }

    /**
     * Check "identifier" feature constraints
     */
    @Check
    def checkIdenitfierFeatureConstraints(DataOperation dataOperation) {
        val featureIndex = dataOperation.features.indexOf(DataOperationFeature.IDENTIFIER)
        if (featureIndex === -1) {
            return
        }

        // Operation may not be validator
        if (dataOperation.hasFeature(DataOperationFeature.VALIDATOR))
            warning("An identifier should not be a validator", dataOperation,
                DataPackage::Literals.DATA_OPERATION__FEATURES, featureIndex)
    }

    /**
     * Check if an imported file exists
     */
    @Check
    def checkImportFileExists(ComplexTypeImport complexTypeImport) {
        if (!LemmaUtils.importFileExists(complexTypeImport.eResource, complexTypeImport.importURI))
            error("File not found", complexTypeImport,
                DataPackage::Literals.COMPLEX_TYPE_IMPORT__IMPORT_URI)
    }

    /**
     * Check for cyclic inheritance relationships between data structures
     */
    @Check
    def checkCyclicInheritance(DataStructure dataStructure) {
        if (LemmaUtils.hasCyclicInheritance(dataStructure, [it.super]))
            error("Cyclic inheritance detected", dataStructure,
                DataPackage::Literals.COMPLEX_TYPE__NAME)
    }

    /**
     * Check for cyclic imports (non-transitive)
     */
    @Check
    def checkForCyclicImports(ComplexTypeImport complexTypeImport) {
        // Function to retrieve all imported Ecore resources of a data model
        val Function<DataModel, List<Resource>> getImportedDataModelResources =
            [complexTypeImports.map[
                EcoreUtil2.getResource(eResource, importURI)
            ]]

        if (LemmaUtils.isCyclicImport(complexTypeImport, DataModel, getImportedDataModelResources))
            error("Cyclic import detected", complexTypeImport,
                DataPackage::Literals.COMPLEX_TYPE_IMPORT__IMPORT_URI)
    }

    /**
     * Check versions for non-emptyness
     */
    @Check
    def checkVersionNotEmpty(Version version) {
        if (version.contexts.empty && version.complexTypes.empty)
            error("A version must define at least one context or complex type", version,
                DataPackage::Literals.VERSION__NAME)
    }
}