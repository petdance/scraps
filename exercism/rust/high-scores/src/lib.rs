#[derive(Debug)]
pub struct HighScores<'a> {
    scores: &'a [u32],
}

// From https://exercism.io/tracks/rust/exercises/high-scores/solutions/0e53b4c14805429ab9b07984d064e8c2
impl<'a> HighScores<'a> {
    pub fn new(scores: &'a [u32]) -> Self {
        HighScores {scores: scores}
    }

    pub fn scores(&self) -> &[u32] {
        // Return all the scores as a slice.
        self.scores
    }

    pub fn latest(&self) -> Option<u32> {
        self.scores.iter().last().cloned()
    }

    pub fn personal_best(&self) -> Option<u32> {
        self.scores.iter().max().cloned()
    }

    pub fn personal_top_three(&self) -> Vec<u32> {
        let mut top_three = self.scores().to_owned();
        top_three.sort();
        top_three.reverse();
        match top_three.len() {
            0 | 1 | 2 => top_three,
            _ => top_three.get(0..=2).unwrap().to_owned()
        }
    }
}
