@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        List<String> parks = ParkLocator.country('India');
        // Verify that a fake result is returned
        System.assertEquals(3, parks.size()); 
    }
}