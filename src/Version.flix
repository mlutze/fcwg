namespace Version {
    pub opaque type SemanticVersion = (Int32, Int32, Int32)

    /// Returns the fcwg version.
    pub def version(): SemanticVersion = SemanticVersion(0, 0, 5)

    instance ToString[SemanticVersion] {
        pub def toString(x: SemanticVersion): String =
            let SemanticVersion(major, minor, patch) = x;
            "v${major}.${minor}.${patch}"
    }

}