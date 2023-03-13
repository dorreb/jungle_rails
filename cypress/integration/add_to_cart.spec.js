describe('Add product to cart from the home page', () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("Adds an item to the cart and increases the cart by 1", () => {
    cy.get('.btn').first().click({ force: true });
    // cy.get(".fa fa-shopping-cart").contains("My Cart (1)");
    cy.contains("My Cart (1)");

  });
});