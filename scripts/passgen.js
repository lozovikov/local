function passgen(id, syllableNum, numPass, useNums, pass_id) { 
    id = typeof(id) != 'undefined' ? id : 'jsPassGenForm';    // параметры по умолчанию
    syllableNum = typeof(syllableNum) != 'undefined' ? syllableNum : 3;
    numPass = typeof(numPass) != 'undefined' ? numPass : 10; 
    useNums = typeof(useNums) != 'undefined' ? useNums : true;

    function rand(from, to) { 
        from = typeof(from) != 'undefined' ? from : 0;    // параметры
        to = typeof(to) != 'undefined' ? to : from + 1;    // по умолчанию
        return Math.round(from + Math.random()*(to - from)); 
    }; 

    function getRandChar(a) { 
        return a.charAt(rand(0,a.length-1)); 
    } 

    var form = document.getElementById(id); 
    // Наиболее подходящие согласные для использования их в качестве заглавных
    var cCommon = ""; 
    var cAll = "bcdfghklmnprstvzjqwx";    // Все согласные 
    var vAll = "aeiouy";    // Все гласные 
    var lAll = cAll + vAll;    // Все буквы

	if (document.getElementById(pass_id).value)
		document.getElementById('instead').innerHTML = " вместо " + document.getElementById(pass_id).value;
	else 
		document.getElementById('instead').innerHTML = "";
    form.innerHTML = ""; 
    for(var j = 0; j < numPass; ++j) { 
        // Коэффициент определяющий вероятность появления числа между слогами
        var numProb = -1, numProbStep = 0.25;
        for(var i = 0; i < syllableNum; ++i) { 
            if(Math.round(Math.random())) { 
                form.innerHTML +=   getRandChar(vAll) + 
                                    getRandChar(lAll); 
            } else { 
                form.innerHTML += getRandChar(vAll); 
            } 
            if(useNums && Math.round(Math.random() + numProb)) { 
                form.innerHTML += rand(0,9); 
                numProb += numProbStep; 
            } 
        } 
		if (numPass > 1)
			form.innerHTML += "<br />"; 
		document.getElementById('copypass').style.display = 'inline';
    }
    return false; 
}

function copypass(from, to, repeat) {
	document.getElementById(to).value = document.getElementById(from).innerHTML;
	document.getElementById(repeat).value = document.getElementById(from).innerHTML;
	document.getElementById('copypass').style.display = 'none';
}