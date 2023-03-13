describe('Navigate from home page to product page', () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it("navigates to product page when product is clicked", () => {
    cy.get("[alt='Giant Tea']").click();
    cy.get(".product-detail").should("be.visible");
  });
});
