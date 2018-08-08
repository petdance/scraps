# Headless Chrome Automated Testing

# QUESTIONS

* Will it do HTML validation?


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

* Can't test video with Headless Chrome.  Images are fine.

    // Setup
    before ( async function() {
        browser = await uppetteer.launch();
        page = await browser.newPage();
        await page.goto('http://...');
    } );


    // The assertion
    it ('should have the correct page title', async function () {
        expect( await page.title()).to.eql('Hello Campers');
    } );

# click()

    // Uses plain ol' DOM functions
    it ( 'dialog box should open on button click', async function () {
        await page.click( '#modelbutton' );
        const className = await page.evaluate( () =>
                document.querySelector('body').className);
        expect(className).to.eql('modal-open');
    } );

# screenshot()

    await page.screenshot({ path: 'screen.png', fullpage: true });

    Can tie this in to this.currentTest.state to see if it's passed or failed and save the screen.

# pdf()

    page.pdf( {path: 'page.pdf' } );


    const noItems = await page.evaluate( () =>
            document.querySelectorAll('li.resultItem').length
            ) );


Can test CSS.  `getComputedStyle`

    expect(colorOfButton).to.eql('rgb(108,117,125)');

    page.setViewport( {width:300, height: 200, deviceScaleFactor: 1} );

* device descriptors

    page.emulate( devices['iPhone X'] );
