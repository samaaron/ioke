
use("ispec")

describe(Hook,
  it("should have the correct kind",
    Hook should have kind("Hook")
  )

  describe("connectedObjects",
    it("should return the connected objects for that hook",
      x = Origin mimic
      y = Origin mimic
      z = Origin mimic
      Hook into(x) connectedObjects[0] should be(x)
      Hook into(x, y) connectedObjects[0] should be(x)
      Hook into(x, y, z) connectedObjects[0] should be(x)

      Hook into(x, y) connectedObjects[1] should be(y)
      Hook into(x, y, z) connectedObjects[1] should be(y)

      Hook into(x, y, z) connectedObjects[2] should be(z)

      Hook into(x, y, z) connectedObjects length should == 3
    )
  )

  describe("into",
    it("should return a new hook object",
      xx = Origin mimic
      yy = Hook into(xx)
      yy should mimic(Hook)
      yy should not be(Hook)
    )

    it("should take one or more arguments",
      Hook into(Origin mimic)
      Hook into(Origin mimic, Origin mimic)
      Hook into(Origin mimic, Origin mimic, Origin mimic)
      Hook into(Origin mimic, Origin mimic, Origin mimic, Origin mimic)
      Hook into(Origin mimic, Origin mimic, Origin mimic, Origin mimic, Origin mimic)

      fn(Hook into()) should signal(Condition Error Invocation TooFewArguments)
    )
  )

  describe("into!",
    it("should add itself to the mimic chain of the first argument and bind it to the second object")
  )

  describe("hook!",
    it("should add a new observed object to the receiver")
  )

  describe("cellAdded",
    it("should have tests")
  )

  describe("cellRemoved",
    it("should have tests")
  )

  describe("cellChanged",
    it("should have tests")
  )

  describe("cellUndefined",
    it("should have tests")
  )

  describe("mimicked",
    it("should have tests")
  )

  describe("mimicAdded",
    it("should have tests")
  )

  describe("mimicRemoved",
    it("should have tests")
  )

  describe("mimicsChanged",
    it("should have tests")
  )
)
