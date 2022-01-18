namespace Version {
    pub opaque type SemanticVersion = (Int, Int, Int)

    pub def version(): SemanticVersion = SemanticVersion(0, 1, 0)

    instance ToString[SemanticVersion] {
        pub def toString(x: SemanticVersion): String =
            let SemanticVersion(major, minor, patch) = x;
            "${major}.${minor}.${patch}"
    }

}