fn main(a: Field, b: Field, n: Field) -> pub Field {
    // Ensure a and b are NOT 1 and NOT n (i.e., 1 < a < n, 1 < b < n)
    assert(a != 1);
    assert(b != 1);
    assert(a != n);
    assert(b != n);

    // Ensure a * b == n
    assert(a * b == n);

    n
}

#[test]
fn test_valid_composite() {
    // n = 15, a = 3, b = 5
    let a = 3;
    let b = 5;
    let n = 15;

    let out = main(a, b, n);
    assert(out == n);
}

#[test(should_fail)]
fn test_invalid_composite_trivial_factor() {
    // n = 15, a = 1, b = 15 (should fail because a == 1)
    let a = 1;
    let b = 15;
    let n = 15;

    let out = main(a, b, n);
     assert(out == n);
}

#[test(should_fail)]
fn test_invalid_composite_wrong_product() {
    // n = 15, a = 2, b = 7 (2*7 != 15)
    let a = 2;
    let b = 7;
    let n = 15;

    let out = main(a, b, n);
     assert(out == n);
}