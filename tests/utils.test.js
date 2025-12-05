const { sum } = require("../utils");

describe("Unit Test: sum()", () => {
  test("adds two numbers correctly", () => {
    expect(sum(2, 3)).toBe(5);
  });

  test("adds negative numbers", () => {
    expect(sum(-1, -1)).toBe(-2);
  });
});
