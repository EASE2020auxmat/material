/**
 * generated by Xtext 2.12.0
 */
package de.fhdo.lemma.operationdsl;

import de.fhdo.lemma.operationdsl.AbstractOperationDslRuntimeModule;
import de.fhdo.lemma.operationdsl.OperationDslResourceDescriptionStrategy;
import org.eclipse.xtext.resource.IDefaultResourceDescriptionStrategy;

/**
 * Use this class to register components to be used at runtime / without the Equinox extension
 * registry.
 * 
 * 
 */
@SuppressWarnings("all")
public class OperationDslRuntimeModule extends AbstractOperationDslRuntimeModule {
  /**
   * Bind custom resource description strategy
   */
  public Class<? extends IDefaultResourceDescriptionStrategy> bindIDefaultResourceDescriptionStrategy() {
    return OperationDslResourceDescriptionStrategy.class;
  }
}
