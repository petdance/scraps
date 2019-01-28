from data import DICTIONARY, LETTER_SCORES

def load_words():
    """Load dictionary into a list and return list"""
    with open(DICTIONARY,'r') as f:
        lines = [line.rstrip('\n') for line in f]
        f.close()


    return lines

def calc_word_value(word):
    """Calculate the value of the word entered into function
    using imported constant mapping LETTER_SCORES"""
    import pprint
    pp = pprint.PrettyPrinter(indent=4)
    #pp.pprint(LETTER_SCORES)

    letters = word.split()
    pp.pprint(word)
    pp.pprint(letters)
    pass

def max_word_value():
    """Calculate the word with the max value, can receive a list
    of words as arg, if none provided uses default DICTIONARY"""
    pass

if __name__ == "__main__":
    pass # run unittests to validate
