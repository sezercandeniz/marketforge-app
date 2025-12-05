const request = require("supertest");
const app = require("../app");

describe("MarketForge API Integration Test", () => {
  it("GET / should return success message", async () => {
    const res = await request(app).get("/");
    expect(res.statusCode).toBe(200);
    expect(res.text).toBe("MarketForge API running!");
  });
});
