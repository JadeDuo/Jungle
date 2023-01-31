describe('Loads Jungle ', () => {
  it('should visit', () => {
    cy.visit('/')
  })
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should click on a product and load that page", () => {
    cy.contains('Scented Blade').click()

    cy.get(".product-detail").should("be.visible");
  });
})