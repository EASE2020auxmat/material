/*
 * generated by Xtext 2.16.0
 */
package de.fhdo.lemma.technology.ui.tests;

import com.google.inject.Injector;
import de.fhdo.lemma.technology.technologydsl.ui.internal.TechnologydslActivator;
import org.eclipse.xtext.testing.IInjectorProvider;

public class TechnologyDslUiInjectorProvider implements IInjectorProvider {

	@Override
	public Injector getInjector() {
		return TechnologydslActivator.getInstance().getInjector("de.fhdo.lemma.technology.TechnologyDsl");
	}

}
