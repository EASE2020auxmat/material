/**
 * generated by Xtext 2.12.0
 */
package de.fhdo.lemma.data;

import de.fhdo.lemma.data.AbstractDataDslRuntimeModule;
import de.fhdo.lemma.data.DataDslResourceDescriptionStrategy;
import de.fhdo.lemma.data.scoping.DataDslScopeProvider;
import org.eclipse.xtext.resource.IDefaultResourceDescriptionStrategy;
import org.eclipse.xtext.scoping.IScopeProvider;

/**
 * Use this class to register components to be used at runtime / without the Equinox extension
 * registry.
 * 
 * 
 */
@SuppressWarnings("all")
public class DataDslRuntimeModule extends AbstractDataDslRuntimeModule {
  @Override
  public Class<? extends IScopeProvider> bindIScopeProvider() {
    return DataDslScopeProvider.class;
  }
  
  public Class<? extends IDefaultResourceDescriptionStrategy> bindIDefaultResourceDescriptionStrategy() {
    return DataDslResourceDescriptionStrategy.class;
  }
}
