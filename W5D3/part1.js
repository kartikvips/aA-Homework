function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// in block
// in block

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// in block
// out of block

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// error

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// in block
// out of block

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}
for (let i = 0; i < array.length; i++) {
  array[i]
}
// error

function madLib(s1, s2, s3){
  console.log(`We shall ${s1.toUpperCase()} the ${s2.toUpperCase()} ${s3.toUpperCase()}`);
}

madLib('make', 'best', 'guac');

function isSubstring(s1, s2){
  console.log(s1.includes(s2));
}

isSubstring("time to program", "time")
isSubstring("Jump for joy", "joys")



function fizzbuzz(array){

  var arrtwo = [];
  for(let i = 0; i < array.length; i++){
    if (array[i] % 3 === 0 && array[i]%5===0){
      continue;
    } else if (array[i] % 3 === 0 || array[i]%5===0){
      arrtwo.push(array[i]);
  }}
  return arrtwo;
}

console.log(fizzbuzz([1,2,3,4,5,6,7,8,9,10]))

function isPrime(n){


}
