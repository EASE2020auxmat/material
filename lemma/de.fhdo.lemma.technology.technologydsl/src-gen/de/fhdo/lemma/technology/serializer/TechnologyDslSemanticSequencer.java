/*
 * generated by Xtext 2.16.0
 */
package de.fhdo.lemma.technology.serializer;

import com.google.inject.Inject;
import de.fhdo.lemma.data.ComplexTypeImport;
import de.fhdo.lemma.data.Context;
import de.fhdo.lemma.data.DataField;
import de.fhdo.lemma.data.DataModel;
import de.fhdo.lemma.data.DataOperation;
import de.fhdo.lemma.data.DataOperationParameter;
import de.fhdo.lemma.data.DataPackage;
import de.fhdo.lemma.data.DataStructure;
import de.fhdo.lemma.data.Enumeration;
import de.fhdo.lemma.data.EnumerationField;
import de.fhdo.lemma.data.ImportedComplexType;
import de.fhdo.lemma.data.ListType;
import de.fhdo.lemma.data.PrimitiveBoolean;
import de.fhdo.lemma.data.PrimitiveByte;
import de.fhdo.lemma.data.PrimitiveCharacter;
import de.fhdo.lemma.data.PrimitiveDate;
import de.fhdo.lemma.data.PrimitiveDouble;
import de.fhdo.lemma.data.PrimitiveFloat;
import de.fhdo.lemma.data.PrimitiveInteger;
import de.fhdo.lemma.data.PrimitiveLong;
import de.fhdo.lemma.data.PrimitiveShort;
import de.fhdo.lemma.data.PrimitiveString;
import de.fhdo.lemma.data.PrimitiveValue;
import de.fhdo.lemma.data.Version;
import de.fhdo.lemma.data.serializer.DataDslSemanticSequencer;
import de.fhdo.lemma.technology.CompatibilityMatrixEntry;
import de.fhdo.lemma.technology.DataFormat;
import de.fhdo.lemma.technology.DeploymentTechnology;
import de.fhdo.lemma.technology.InfrastructureTechnology;
import de.fhdo.lemma.technology.OperationAspect;
import de.fhdo.lemma.technology.OperationAspectPointcut;
import de.fhdo.lemma.technology.OperationAspectPointcutSelector;
import de.fhdo.lemma.technology.OperationEnvironment;
import de.fhdo.lemma.technology.PossiblyImportedTechnologySpecificType;
import de.fhdo.lemma.technology.Protocol;
import de.fhdo.lemma.technology.ServiceAspect;
import de.fhdo.lemma.technology.ServiceAspectPointcut;
import de.fhdo.lemma.technology.ServiceAspectPointcutSelector;
import de.fhdo.lemma.technology.Technology;
import de.fhdo.lemma.technology.TechnologyImport;
import de.fhdo.lemma.technology.TechnologyPackage;
import de.fhdo.lemma.technology.TechnologySpecificDataStructure;
import de.fhdo.lemma.technology.TechnologySpecificListType;
import de.fhdo.lemma.technology.TechnologySpecificPrimitiveType;
import de.fhdo.lemma.technology.TechnologySpecificProperty;
import de.fhdo.lemma.technology.services.TechnologyDslGrammarAccess;
import java.util.Set;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.xtext.Action;
import org.eclipse.xtext.Parameter;
import org.eclipse.xtext.ParserRule;
import org.eclipse.xtext.serializer.ISerializationContext;
import org.eclipse.xtext.serializer.acceptor.SequenceFeeder;
import org.eclipse.xtext.serializer.sequencer.ITransientValueService.ValueTransient;

@SuppressWarnings("all")
public class TechnologyDslSemanticSequencer extends DataDslSemanticSequencer {

	@Inject
	private TechnologyDslGrammarAccess grammarAccess;
	
	@Override
	public void sequence(ISerializationContext context, EObject semanticObject) {
		EPackage epackage = semanticObject.eClass().getEPackage();
		ParserRule rule = context.getParserRule();
		Action action = context.getAssignedAction();
		Set<Parameter> parameters = context.getEnabledBooleanParameters();
		if (epackage == DataPackage.eINSTANCE)
			switch (semanticObject.eClass().getClassifierID()) {
			case DataPackage.COMPLEX_TYPE_IMPORT:
				sequence_ComplexTypeImport(context, (ComplexTypeImport) semanticObject); 
				return; 
			case DataPackage.CONTEXT:
				sequence_Context(context, (Context) semanticObject); 
				return; 
			case DataPackage.DATA_FIELD:
				sequence_DataField(context, (DataField) semanticObject); 
				return; 
			case DataPackage.DATA_MODEL:
				sequence_DataModel(context, (DataModel) semanticObject); 
				return; 
			case DataPackage.DATA_OPERATION:
				sequence_DataOperation(context, (DataOperation) semanticObject); 
				return; 
			case DataPackage.DATA_OPERATION_PARAMETER:
				sequence_DataOperationParameter(context, (DataOperationParameter) semanticObject); 
				return; 
			case DataPackage.DATA_STRUCTURE:
				sequence_DataStructure(context, (DataStructure) semanticObject); 
				return; 
			case DataPackage.ENUMERATION:
				sequence_Enumeration(context, (Enumeration) semanticObject); 
				return; 
			case DataPackage.ENUMERATION_FIELD:
				sequence_EnumerationField(context, (EnumerationField) semanticObject); 
				return; 
			case DataPackage.IMPORTED_COMPLEX_TYPE:
				sequence_ImportedComplexType(context, (ImportedComplexType) semanticObject); 
				return; 
			case DataPackage.LIST_TYPE:
				sequence_ListType(context, (ListType) semanticObject); 
				return; 
			case DataPackage.PRIMITIVE_BOOLEAN:
				sequence_PrimitiveType(context, (PrimitiveBoolean) semanticObject); 
				return; 
			case DataPackage.PRIMITIVE_BYTE:
				sequence_PrimitiveType(context, (PrimitiveByte) semanticObject); 
				return; 
			case DataPackage.PRIMITIVE_CHARACTER:
				sequence_PrimitiveType(context, (PrimitiveCharacter) semanticObject); 
				return; 
			case DataPackage.PRIMITIVE_DATE:
				sequence_PrimitiveType(context, (PrimitiveDate) semanticObject); 
				return; 
			case DataPackage.PRIMITIVE_DOUBLE:
				sequence_PrimitiveType(context, (PrimitiveDouble) semanticObject); 
				return; 
			case DataPackage.PRIMITIVE_FLOAT:
				sequence_PrimitiveType(context, (PrimitiveFloat) semanticObject); 
				return; 
			case DataPackage.PRIMITIVE_INTEGER:
				sequence_PrimitiveType(context, (PrimitiveInteger) semanticObject); 
				return; 
			case DataPackage.PRIMITIVE_LONG:
				sequence_PrimitiveType(context, (PrimitiveLong) semanticObject); 
				return; 
			case DataPackage.PRIMITIVE_SHORT:
				sequence_PrimitiveType(context, (PrimitiveShort) semanticObject); 
				return; 
			case DataPackage.PRIMITIVE_STRING:
				sequence_PrimitiveType(context, (PrimitiveString) semanticObject); 
				return; 
			case DataPackage.PRIMITIVE_VALUE:
				sequence_PrimitiveValue(context, (PrimitiveValue) semanticObject); 
				return; 
			case DataPackage.VERSION:
				sequence_Version(context, (Version) semanticObject); 
				return; 
			}
		else if (epackage == TechnologyPackage.eINSTANCE)
			switch (semanticObject.eClass().getClassifierID()) {
			case TechnologyPackage.COMPATIBILITY_MATRIX_ENTRY:
				sequence_CompatibilityMatrixEntry(context, (CompatibilityMatrixEntry) semanticObject); 
				return; 
			case TechnologyPackage.DATA_FORMAT:
				sequence_DataFormat(context, (DataFormat) semanticObject); 
				return; 
			case TechnologyPackage.DEPLOYMENT_TECHNOLOGY:
				sequence_DeploymentTechnology(context, (DeploymentTechnology) semanticObject); 
				return; 
			case TechnologyPackage.INFRASTRUCTURE_TECHNOLOGY:
				sequence_InfrastructureTechnology(context, (InfrastructureTechnology) semanticObject); 
				return; 
			case TechnologyPackage.OPERATION_ASPECT:
				sequence_OperationAspect(context, (OperationAspect) semanticObject); 
				return; 
			case TechnologyPackage.OPERATION_ASPECT_POINTCUT:
				sequence_OperationAspectPointcut(context, (OperationAspectPointcut) semanticObject); 
				return; 
			case TechnologyPackage.OPERATION_ASPECT_POINTCUT_SELECTOR:
				sequence_OperationAspectPointcutSelector(context, (OperationAspectPointcutSelector) semanticObject); 
				return; 
			case TechnologyPackage.OPERATION_ENVIRONMENT:
				sequence_OperationEnvironment(context, (OperationEnvironment) semanticObject); 
				return; 
			case TechnologyPackage.POSSIBLY_IMPORTED_TECHNOLOGY_SPECIFIC_TYPE:
				sequence_PossiblyImportedTechnologySpecificType(context, (PossiblyImportedTechnologySpecificType) semanticObject); 
				return; 
			case TechnologyPackage.PROTOCOL:
				sequence_Protocol(context, (Protocol) semanticObject); 
				return; 
			case TechnologyPackage.SERVICE_ASPECT:
				sequence_ServiceAspect(context, (ServiceAspect) semanticObject); 
				return; 
			case TechnologyPackage.SERVICE_ASPECT_POINTCUT:
				sequence_ServiceAspectPointcut(context, (ServiceAspectPointcut) semanticObject); 
				return; 
			case TechnologyPackage.SERVICE_ASPECT_POINTCUT_SELECTOR:
				sequence_ServiceAspectPointcutSelector(context, (ServiceAspectPointcutSelector) semanticObject); 
				return; 
			case TechnologyPackage.TECHNOLOGY:
				sequence_Technology(context, (Technology) semanticObject); 
				return; 
			case TechnologyPackage.TECHNOLOGY_IMPORT:
				sequence_TechnologyImport(context, (TechnologyImport) semanticObject); 
				return; 
			case TechnologyPackage.TECHNOLOGY_SPECIFIC_DATA_STRUCTURE:
				sequence_TechnologySpecificDataStructure(context, (TechnologySpecificDataStructure) semanticObject); 
				return; 
			case TechnologyPackage.TECHNOLOGY_SPECIFIC_LIST_TYPE:
				sequence_TechnologySpecificListType(context, (TechnologySpecificListType) semanticObject); 
				return; 
			case TechnologyPackage.TECHNOLOGY_SPECIFIC_PRIMITIVE_TYPE:
				sequence_TechnologySpecificPrimitiveType(context, (TechnologySpecificPrimitiveType) semanticObject); 
				return; 
			case TechnologyPackage.TECHNOLOGY_SPECIFIC_PROPERTY:
				sequence_TechnologySpecificProperty(context, (TechnologySpecificProperty) semanticObject); 
				return; 
			}
		if (errorAcceptor != null)
			errorAcceptor.accept(diagnosticProvider.createInvalidContextOrTypeDiagnostic(semanticObject, context));
	}
	
	/**
	 * Contexts:
	 *     CompatibilityMatrixEntry returns CompatibilityMatrixEntry
	 *
	 * Constraint:
	 *     (
	 *         compatibleTypes+=PossiblyImportedTechnologySpecificType 
	 *         compatibleTypes+=PossiblyImportedTechnologySpecificType* 
	 *         direction=CompatibilityDirection 
	 *         mappingType=PossiblyImportedTechnologySpecificType
	 *     )
	 */
	protected void sequence_CompatibilityMatrixEntry(ISerializationContext context, CompatibilityMatrixEntry semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     DataFormat returns DataFormat
	 *
	 * Constraint:
	 *     formatName=ID
	 */
	protected void sequence_DataFormat(ISerializationContext context, DataFormat semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, TechnologyPackage.Literals.DATA_FORMAT__FORMAT_NAME) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, TechnologyPackage.Literals.DATA_FORMAT__FORMAT_NAME));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getDataFormatAccess().getFormatNameIDTerminalRuleCall_0(), semanticObject.getFormatName());
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     DeploymentTechnology returns DeploymentTechnology
	 *
	 * Constraint:
	 *     (name=ID operationEnvironments+=OperationEnvironment operationEnvironments+=OperationEnvironment* serviceProperties+=TechnologySpecificProperty*)
	 */
	protected void sequence_DeploymentTechnology(ISerializationContext context, DeploymentTechnology semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     InfrastructureTechnology returns InfrastructureTechnology
	 *
	 * Constraint:
	 *     (name=ID operationEnvironments+=OperationEnvironment operationEnvironments+=OperationEnvironment* serviceProperties+=TechnologySpecificProperty*)
	 */
	protected void sequence_InfrastructureTechnology(ISerializationContext context, InfrastructureTechnology semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     OperationAspectPointcutSelector returns OperationAspectPointcutSelector
	 *
	 * Constraint:
	 *     (pointcuts+=OperationAspectPointcut pointcuts+=OperationAspectPointcut*)
	 */
	protected void sequence_OperationAspectPointcutSelector(ISerializationContext context, OperationAspectPointcutSelector semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     OperationAspectPointcut returns OperationAspectPointcut
	 *
	 * Constraint:
	 *     (forTechnology?='technology' technology=[EObject|ID])
	 */
	protected void sequence_OperationAspectPointcut(ISerializationContext context, OperationAspectPointcut semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, TechnologyPackage.Literals.OPERATION_ASPECT_POINTCUT__FOR_TECHNOLOGY) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, TechnologyPackage.Literals.OPERATION_ASPECT_POINTCUT__FOR_TECHNOLOGY));
			if (transientValues.isValueTransient(semanticObject, TechnologyPackage.Literals.OPERATION_ASPECT_POINTCUT__TECHNOLOGY) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, TechnologyPackage.Literals.OPERATION_ASPECT_POINTCUT__TECHNOLOGY));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getOperationAspectPointcutAccess().getForTechnologyTechnologyKeyword_0_0(), semanticObject.isForTechnology());
		feeder.accept(grammarAccess.getOperationAspectPointcutAccess().getTechnologyEObjectIDTerminalRuleCall_2_0_1(), semanticObject.eGet(TechnologyPackage.Literals.OPERATION_ASPECT_POINTCUT__TECHNOLOGY, false));
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     OperationAspect returns OperationAspect
	 *
	 * Constraint:
	 *     (
	 *         name=ID 
	 *         (features+=AspectFeature features+=AspectFeature*)? 
	 *         joinPoints+=OperationJoinPointType 
	 *         joinPoints+=OperationJoinPointType* 
	 *         pointcutSelectors+=OperationAspectPointcutSelector* 
	 *         properties+=TechnologySpecificProperty*
	 *     )
	 */
	protected void sequence_OperationAspect(ISerializationContext context, OperationAspect semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     OperationEnvironment returns OperationEnvironment
	 *
	 * Constraint:
	 *     (environmentName=STRING default?='default'?)
	 */
	protected void sequence_OperationEnvironment(ISerializationContext context, OperationEnvironment semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     PossiblyImportedTechnologySpecificType returns PossiblyImportedTechnologySpecificType
	 *
	 * Constraint:
	 *     (import=[TechnologyImport|ID]? type=[Type|QualifiedName])
	 */
	protected void sequence_PossiblyImportedTechnologySpecificType(ISerializationContext context, PossiblyImportedTechnologySpecificType semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     Protocol returns Protocol
	 *
	 * Constraint:
	 *     (communicationType=CommunicationType name=ID dataFormats+=DataFormat dataFormats+=DataFormat* (default?='default' defaultFormat=[DataFormat|ID])?)
	 */
	protected void sequence_Protocol(ISerializationContext context, Protocol semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     ServiceAspectPointcutSelector returns ServiceAspectPointcutSelector
	 *
	 * Constraint:
	 *     (pointcuts+=ServiceAspectPointcut pointcuts+=ServiceAspectPointcut*)
	 */
	protected void sequence_ServiceAspectPointcutSelector(ISerializationContext context, ServiceAspectPointcutSelector semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     ServiceAspectPointcut returns ServiceAspectPointcut
	 *
	 * Constraint:
	 *     (
	 *         (forExchangePattern?='exchange_pattern' exchangePattern=ExchangePattern) | 
	 *         (forCommunicationType?='communication_type' communicationType=CommunicationType) | 
	 *         (forProtocol?='protocol' protocol=[Protocol|ID]) | 
	 *         (forDataFormat?='data_format' dataFormat=[DataFormat|ID])
	 *     )
	 */
	protected void sequence_ServiceAspectPointcut(ISerializationContext context, ServiceAspectPointcut semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     ServiceAspect returns ServiceAspect
	 *
	 * Constraint:
	 *     (
	 *         name=ID 
	 *         (features+=AspectFeature features+=AspectFeature*)? 
	 *         joinPoints+=ServiceJoinPointType 
	 *         joinPoints+=ServiceJoinPointType* 
	 *         pointcutSelectors+=ServiceAspectPointcutSelector* 
	 *         properties+=TechnologySpecificProperty*
	 *     )
	 */
	protected void sequence_ServiceAspect(ISerializationContext context, ServiceAspect semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     TechnologyImport returns TechnologyImport
	 *
	 * Constraint:
	 *     (importURI=STRING name=ID)
	 */
	protected void sequence_TechnologyImport(ISerializationContext context, TechnologyImport semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, TechnologyPackage.Literals.TECHNOLOGY_IMPORT__IMPORT_URI) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, TechnologyPackage.Literals.TECHNOLOGY_IMPORT__IMPORT_URI));
			if (transientValues.isValueTransient(semanticObject, TechnologyPackage.Literals.TECHNOLOGY_IMPORT__NAME) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, TechnologyPackage.Literals.TECHNOLOGY_IMPORT__NAME));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getTechnologyImportAccess().getImportURISTRINGTerminalRuleCall_3_0(), semanticObject.getImportURI());
		feeder.accept(grammarAccess.getTechnologyImportAccess().getNameIDTerminalRuleCall_5_0(), semanticObject.getName());
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     TechnologySpecificDataStructure returns TechnologySpecificDataStructure
	 *
	 * Constraint:
	 *     name=ID
	 */
	protected void sequence_TechnologySpecificDataStructure(ISerializationContext context, TechnologySpecificDataStructure semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, DataPackage.Literals.COMPLEX_TYPE__NAME) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, DataPackage.Literals.COMPLEX_TYPE__NAME));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getTechnologySpecificDataStructureAccess().getNameIDTerminalRuleCall_2_0(), semanticObject.getName());
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     TechnologySpecificListType returns TechnologySpecificListType
	 *
	 * Constraint:
	 *     name=ID
	 */
	protected void sequence_TechnologySpecificListType(ISerializationContext context, TechnologySpecificListType semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, DataPackage.Literals.COMPLEX_TYPE__NAME) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, DataPackage.Literals.COMPLEX_TYPE__NAME));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getTechnologySpecificListTypeAccess().getNameIDTerminalRuleCall_2_0(), semanticObject.getName());
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     TechnologySpecificPrimitiveType returns TechnologySpecificPrimitiveType
	 *
	 * Constraint:
	 *     (name=ID (basicBuiltinPrimitiveTypes+=PrimitiveType basicBuiltinPrimitiveTypes+=PrimitiveType* default?='default'?)?)
	 */
	protected void sequence_TechnologySpecificPrimitiveType(ISerializationContext context, TechnologySpecificPrimitiveType semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     TechnologySpecificProperty returns TechnologySpecificProperty
	 *
	 * Constraint:
	 *     (type=PrimitiveType name=ID defaultValue=PrimitiveValue? (features+=PropertyFeature features+=PropertyFeature*)?)
	 */
	protected void sequence_TechnologySpecificProperty(ISerializationContext context, TechnologySpecificProperty semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     Technology returns Technology
	 *
	 * Constraint:
	 *     (
	 *         imports+=TechnologyImport* 
	 *         name=ID 
	 *         (
	 *             (primitiveTypes+=TechnologySpecificPrimitiveType | listTypes+=TechnologySpecificListType | dataStructures+=TechnologySpecificDataStructure)+ 
	 *             compatibilityEntries+=CompatibilityMatrixEntry*
	 *         )? 
	 *         protocols+=Protocol* 
	 *         serviceAspects+=ServiceAspect* 
	 *         deploymentTechnologies+=DeploymentTechnology* 
	 *         infrastructureTechnologies+=InfrastructureTechnology* 
	 *         operationAspects+=OperationAspect*
	 *     )
	 */
	protected void sequence_Technology(ISerializationContext context, Technology semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
}