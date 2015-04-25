package dna.features;

import java.util.ArrayList;
import java.util.List;

import dna.DNAFeature;
import dna.DNAToken;
import dna.Utils;

/**
 * Add the tokens as features
 *
 */

public class WordDNAFeature extends DNAFeature implements VocabularyDependent {
	
	public static void main(String[] args) {
		//Test case
		
		List<DNAToken> tokens = new ArrayList<DNAToken>();
		DNAToken tok1 = new DNAToken();
		tok1.setText("Rakan");
		
		DNAToken tok2 = new DNAToken();
		tok2.setText("writing");
		
		DNAToken tok3 = new DNAToken();
		tok3.setText("haKAn");
		
		DNAToken tok4 = new DNAToken();
		tok4.setText("is");
		
		DNAToken tok5 = new DNAToken();
		tok5.setText("writing");
		
		DNAToken tok6 = new DNAToken();
		tok6.setText("text");
		
		tokens.add( tok1 );
		tokens.add( tok2 );
		tokens.add( tok3 );
		tokens.add( tok4 );
		tokens.add( tok5 );
		tokens.add( tok6 );
		
		DNAFeature f = new WordDNAFeature();
		f.buildFeature(tokens);
		for (DNAToken tok : tokens) {
			System.out.println( tok.getText() + ": " + tok.getFeatures() );
		}
	}
	
	private Vocabulary vocab;
	
	public WordDNAFeature() {
	}


	@Override
	public void buildFeature(List<DNAToken> tokens) {
		if(vocab == null)
			throw new RuntimeException("A vocabulary is not set to build the feature!");
		
		if (!tokens.isEmpty()) {
			for (DNAToken tok : tokens) {
				int index = vocab.getIndex( tok.getText() );
				double[] oneHot = new double[ vocab.getSize() ];
				if (index != -1) {
					oneHot[index] = 1;
				}
				tok.getFeatures().addAll(Utils.asList(oneHot));
			}
		}
		else {
			throw new RuntimeException("No tokens in the tokens list to add features to!");
		}

	}


	@Override
	public int numberOfFeatures() {
		if(vocab == null)
			throw new RuntimeException("A vocabulary is not set to get the number of features!");
		return vocab.getSize();
	}


	public void setVocab(Vocabulary vocab) {
		this.vocab = vocab;
	}

	
}