
fn inflect_bottles(n: u32) -> String {
    return match n {
        1 => String::from("1 bottle"),
        _ => format!("{} bottles", n).to_string(),
    };
}
pub fn verse(n: u32) -> String {
    let these = inflect_bottles(n);
    let that = inflect_bottles(n-1);

    return match n {
        1 => String::from("1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"),
        0 => String::from("No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"),
        _ => format!("{0} of beer on the wall, {0} of beer.\nTake one down and pass it around, {1} of beer on the wall.\n", these, that),
    };
}

pub fn sing(start: u32, end: u32) -> String {
    unimplemented!("sing verses {} to {}, inclusive", start, end)
}
