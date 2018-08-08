# Headless Chrome Automated Testing

* Derek Binkley

* Headless Chrome introduced June 2017
* Full browser, but no GUI
* Controlled by Node library Puppeteer

* Faster and more stable than PhantomJS, and it doesn't eat memory like crazy. The PhantomJS developer abandoned it
when Headless Chrome was announced.

* Not meant to replace Selenium.

* Puppeteer - Gives us Chrome
* Mocha - Runs Test
* Chai - Provides assertions


    // Setup
    before ( async function() {
        browser = await uppetteer.launch();
        page = await browser.newPage();
        await page.goto('http://...');
    } );


    // The assertion
    it ('should have the correct page title', async function () {
        expect( await page.title()).to.eql('Hello Campers');
    });

* Can't test video with Headless Chrome.  Images are fine.
