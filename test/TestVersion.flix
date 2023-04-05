mod TestVersion {
    use Version.SemanticVersion
    use Version.SemanticVersion.SemanticVersion
    use Version.version

    @test
    def testToString(): Bool = "${SemanticVersion(1, 2, 3)}" == "v1.2.3"

    @test
    def testVersionValid(): Bool =
        let SemanticVersion(major, minor, patch) = version();
        major >= 0 and minor >= 0 and patch >= 0

    @test
    def testSkipVersion010(): Bool =
        version() != SemanticVersion(0, 1, 0)
}