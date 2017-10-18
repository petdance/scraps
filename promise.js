console.log( 'Starting' );


const p1 = new Promise( function( resolve,reject) {
    console.log( 'P1 has resolved' );
    resolve( 'Hello' );
});

const p2 = new Promise( function( resolve,reject) {
    console.log( 'P2 has resolved' );
    resolve( 'Hello' );
});

p1.then(p2);

console.log( 'all done' );
