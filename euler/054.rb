#!/usr/bin/ruby -w

require 'test/unit'

=begin rdoc

http://projecteuler.net/index.php?section=problems&id=54

In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:

    High Card: Highest value card.
    One Pair: Two cards of the same value.
    Two Pairs: Two different pairs.
    Three of a Kind: Three cards of the same value.
    Straight: All cards are consecutive values.
    Flush: All cards of the same suit.
    Full House: Three of a kind and a pair.
    Four of a Kind: Four cards of the same value.
    Straight Flush: All cards are consecutive values of same suit.
    Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

The cards are valued in the order:
2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

If two players have the same ranked hands then the rank made up of
the highest value wins; for example, a pair of eights beats a pair
of fives (see example 1 below). But if two ranks tie, for example,
both players have a pair of queens, then highest cards in each hand
are compared (see example 4 below); if the highest cards tie then
the next highest cards are compared, and so on.

The file, poker.txt, contains one-thousand random hands dealt to
two players. Each line of the file contains ten cards (separated
by a single space): the first five are Player 1's cards and the
last five are Player 2's cards. You can assume that all hands are
valid (no invalid characters or repeated cards), each player's hand
is in no specific order, and in each hand there is a clear winner.

How many hands does Player 1 win?

=end

class CardValue
    def initialize( cardvaluetext )
        @text = cardvaluetext
    end

    def to_s
        @text
    end

    def to_i
        case @text
        when 'T' then 10
        when 'J' then 11
        when 'Q' then 12
        when 'K' then 13
        when 'A' then 14
        else @text.to_i
        end
    end
end

class Card
    def initialize( cardtext )
        @value = CardValue.new( cardtext[0,1] )
        @suit  = cardtext[1,1]
    end

    def suit
        @suit
    end

    def value
        @value
    end
end

class Hand
    def initialize( cardtext )
        @origtext = cardtext
        @cards = cardtext.collect { |text| Card.new( text ) }

        # Aggregate the pairs.  oak = "of a kind"
        oak = Hash.new
        @cards.each { |i| oak[ i.value.to_s ] = oak[ i.value.to_s ] ? (oak[ i.value.to_s ] + 1) : 1 }

        @oaks = []
        oak.each { |cardvalue,count| @oaks.push( [count,cardvalue] ) if count > 1 }
        @oaks = @oaks.sort { |a,b| compare(a,b) } # Reverse sort on cardvalue

        case
        when is_royal_flush
            @value  = 1000
            @kicker = CardValue.new('A')

        when is_straight_flush
            @value  = 900
            @kicker = high_card

        when is_four_of_a_kind
            @value  = 800
            @kicker = @oaks[0,1]

        when is_full_house
            @value  = 700
            @kicker = @oaks[0,1]

        when is_flush
            @value  = 600
            @kicker = high_card

        when is_straight
            @value  = 500
            @kicker = high_card

        when is_three_of_a_kind
            @value  = 400
            @kicker = @oaks[0,1]

        when is_two_pair
            @value  = 300
            @kicker = @oaks[0,1]

        when is_one_pair
            @value  = 200
            @kicker = @oaks[0,1]

        else
            @value  = 23
            @kicker = high_card
        end
    end

    def compare(a,b)
        cmp = b[0] <=> a[0]
        return cmp if cmp != 0
        return b[1] <=> a[1]
    end

    def value
        @value
    end

    def kicker
        @cards.collect { |card| card.to_i }.max
    end

    def is_royal_flush
        is_straight && is_flush && (high_card.value.to_s == 'A')
    end

    def is_straight_flush
        is_straight && is_flush
    end

    def is_four_of_a_kind
        @oaks.count == 1 && @oaks[0][0] == 4
    end

    def is_full_house
        @oaks.count == 2 && @oaks[0][0] == 3 && @oaks[1][0] == 2
    end

    def is_flush
        @cards.each { |card| return false if card.suit != @cards[0].suit }
        return true
    end

    def is_straight
        sorted_ranks = @cards.collect { |card| card.value.to_i }.sort
        prev = sorted_ranks.shift
        sorted_ranks.each { |i| return false if prev+1 != i; prev = i; }

        return true
    end

    def is_three_of_a_kind
        @oaks.count == 1 && @oaks[0][0] == 3
    end

    def is_two_pair
        @oaks.count == 2 && @oaks[0][0] == 2 && @oaks[1][0] == 2
    end

    def is_one_pair
        @oaks.count == 1 && @oaks[0][0] == 2
    end

    def high_card
        high = nil
        @cards.each { |card| high = card if !high || (card.value.to_i > high.value.to_i) }

        return high
    end

end

class HandTest < Test::Unit::TestCase
    def test_simple
        # high card
        hand = Hand.new( [ '5D', '3S', '9S', '2S', 'QS' ] )
        assert_equal( 'Q',   hand.high_card.value.to_s )
        assert_equal( false, hand.is_royal_flush )
        assert_equal( false, hand.is_flush )
        assert_equal( false, hand.is_straight )
        assert_equal( false, hand.is_two_pair )
        assert_equal( false, hand.is_one_pair )

        # one pair
        hand = Hand.new( [ '5S', '2D', 'AS', '2C', 'AH' ] )
        assert_equal( false, hand.is_royal_flush )
        assert_equal( false, hand.is_flush )
        assert_equal( false, hand.is_straight )
        assert_equal( true,  hand.is_two_pair )
        assert_equal( false, hand.is_one_pair )

        # two pair
        hand = Hand.new( [ '5S', '3D', 'AS', '2C', 'AH' ] )
        assert_equal( false, hand.is_royal_flush )
        assert_equal( false, hand.is_flush )
        assert_equal( false, hand.is_straight )
        assert_equal( false, hand.is_two_pair )
        assert_equal( true,  hand.is_one_pair )

        # three of a kind
        hand = Hand.new( [ '5S', 'TD', 'TS', '2C', 'TH' ] )
        assert_equal( false, hand.is_full_house )
        assert_equal( false, hand.is_straight )
        assert_equal( true,  hand.is_three_of_a_kind )
        assert_equal( false, hand.is_two_pair )
        assert_equal( false, hand.is_one_pair )

        # straight
        hand = Hand.new( [ '5S', '7D', '8C', '4D', '6H' ] )
        assert_equal( false, hand.is_full_house )
        assert_equal( true,  hand.is_straight )
        assert_equal( false, hand.is_three_of_a_kind )
        assert_equal( false, hand.is_two_pair )
        assert_equal( false, hand.is_one_pair )

        # flush
        hand = Hand.new( [ '5S', '3S', '9S', '2S', 'AS' ] )
        assert_equal( false, hand.is_royal_flush )
        assert_equal( true,  hand.is_flush )
        assert_equal( false, hand.is_full_house )
        assert_equal( false, hand.is_straight )
        assert_equal( false, hand.is_two_pair )
        assert_equal( false, hand.is_one_pair )

        # full house
        hand = Hand.new( [ '5S', 'TD', 'TS', '5C', 'TH' ] )
        assert_equal( true,  hand.is_full_house )
        assert_equal( false, hand.is_straight )

        # four of a kind
        hand = Hand.new( [ 'TS', 'TD', 'TC', '2C', 'TH' ] )
        assert_equal( true,  hand.is_four_of_a_kind )
        assert_equal( false, hand.is_flush )
        assert_equal( false, hand.is_full_house )
        assert_equal( false, hand.is_straight )
        assert_equal( false, hand.is_two_pair )
        assert_equal( false, hand.is_one_pair )

        # straight flush
        hand = Hand.new( [ '2H', '4H', '6H', '3H', '5H' ] )
        assert_equal( false, hand.is_royal_flush )
        assert_equal( true,  hand.is_straight_flush )
        assert_equal( false, hand.is_four_of_a_kind )
        assert_equal( false, hand.is_full_house )
        assert_equal( true,  hand.is_flush )
        assert_equal( true,  hand.is_straight )
        assert_equal( false, hand.is_two_pair )
        assert_equal( false, hand.is_one_pair )

        # royal flush
        hand = Hand.new( [ 'AS', 'TS', 'QS', 'KS', 'JS' ] )
        assert_equal( true,  hand.is_royal_flush )
        assert_equal( true,  hand.is_straight_flush )
        assert_equal( false, hand.is_four_of_a_kind )
        assert_equal( false, hand.is_full_house )
        assert_equal( true,  hand.is_flush )
        assert_equal( true,  hand.is_straight )
        assert_equal( false, hand.is_two_pair )
        assert_equal( false, hand.is_one_pair )

    end
end

f = File.new( '054.txt', 'r' )
f.each { |line|
    line.chomp!
    cards = line.split( ' ' )
    hands = [ Hand.new( cards[0,5] ), Hand.new( cards[5,5] ) ]
}
