mod Version {
    use SemanticVersion.SemanticVersion

    pub enum SemanticVersion(Int32, Int32, Int32) with Eq

    /// Returns the fcwg version.
    pub def version(): SemanticVersion = SemanticVersion(0, 0, 19)

    instance ToString[SemanticVersion] {
        pub def toString(x: SemanticVersion): String =
            let SemanticVersion(major, minor, patch) = x;
            "v${major}.${minor}.${patch}"
    }

}