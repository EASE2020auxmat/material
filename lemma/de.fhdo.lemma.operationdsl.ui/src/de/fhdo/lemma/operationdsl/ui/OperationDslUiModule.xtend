/*
 * generated by Xtext 2.16.0
 */
package de.fhdo.lemma.operationdsl.ui

import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import org.eclipse.xtext.ui.editor.syntaxcoloring.IHighlightingConfiguration
import org.eclipse.xtext.ide.editor.syntaxcoloring.ISemanticHighlightingCalculator
import de.fhdo.lemma.operationdsl.ui.highlighting.HighlightingCalculator
import de.fhdo.lemma.operationdsl.ui.highlighting.HighlightingConfiguration

/**
 * Use this class to register components to be used within the Eclipse IDE.
 *
 * 
 */
@FinalFieldsConstructor
class OperationDslUiModule extends AbstractOperationDslUiModule {
    def Class<? extends IHighlightingConfiguration> bindIHighlightingConfiguration() {
        HighlightingConfiguration
    }

    def Class<? extends ISemanticHighlightingCalculator> bindISemanticHighlightingCalculator() {
        HighlightingCalculator
    }
}
