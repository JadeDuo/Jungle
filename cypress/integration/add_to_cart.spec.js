describe('Loads Jungle and displays products', () => {
  it('should visit', () => {
    cy.visit('/')
  })
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("should click on add to cart and update cart count in nav", () => {
    cy.get(':nth-child(1) > a > img').scrollIntoView()

    cy.get(':nth-child(1) > div > .button_to > .btn').click()
    
    cy.contains('My Cart (1)')
  });
})