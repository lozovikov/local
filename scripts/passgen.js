function passgen(id, syllableNum, numPass, useNums, pass_id) { 
    id = typeof(id) != 'undefined' ? id : 'jsPassGenForm';    // ��������� �� ���������
    syllableNum = typeof(syllableNum) != 'undefined' ? syllableNum : 3;
    numPass = typeof(numPass) != 'undefined' ? numPass : 10; 
    useNums = typeof(useNums) != 'undefined' ? useNums : true;

    function rand(from, to) { 
        from = typeof(from) != 'undefined' ? from : 0;    // ���������
        to = typeof(to) != 'undefined' ? to : from + 1;    // �� ���������
        return Math.round(from + Math.random()*(to - from)); 
    }; 

    function getRandChar(a) { 
        return a.charAt(rand(0,a.length-1)); 
    } 

    var form = document.getElementById(id); 
    // �������� ���������� ��������� ��� ������������� �� � �������� ���������
    var cCommon = ""; 
    var cAll = "bcdfghklmnprstvzjqwx";    // ��� ��������� 
    var vAll = "aeiouy";    // ��� ������� 
    var lAll = cAll + vAll;    // ��� �����

	if (document.getElementById(pass_id).value)
		document.getElementById('instead').innerHTML = " ������ " + document.getElementById(pass_id).value;
	else 
		document.getElementById('instead').innerHTML = "";
    form.innerHTML = ""; 
    for(var j = 0; j < numPass; ++j) { 
        // ����������� ������������ ����������� ��������� ����� ����� �������
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