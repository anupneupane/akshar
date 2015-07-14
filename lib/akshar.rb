require "akshar/version"

module ToAkshar

  SMALL_NUMBERS = {""=>"", 0=>"शुन्य", 1=>"एक", 2=>"दुई", 3=>"तीन", 4=>"चार", 5=>"पाँच", 6=>"छ", 7=>"सात", 8=>"आठ", 9=>"नौ", 10=>"दश", 11=>"एघार", 12=>"बाह्र", 13=>"तेह्र", 14=>"चौध", 15=>"पन्ध्र", 16=>"सोह्र", 17=>"सत्र", 18=>"अठार", 19=>"उन्नाइस", 20=>"विस", 21=>"एक्काइस", 22=>"बाइस", 23=>"तेईस", 24=>"चौविस", 25=>"पच्चिस", 26=>"छब्बिस", 27=>"सत्ताईस", 28=>"अठ्ठाईस", 29=>"उनन्तिस", 30=>"तिस", 31=>"एकत्तिस", 32=>"बत्तिस", 33=>"तेत्तिस", 34=>"चौँतिस", 35=>"पैँतिस", 36=>" छ्त्तीस", 37=>"सैंतीस", 38=>"अठतीस", 39=>"उनन्चालीस", 40=>"चालीस", 41=>"एकचालीस", 42=>"बयालीस", 43=>"त्रियालीस", 44=>"चवालीस", 45=>"पैँतालीस", 46=>"छयालीस", 47=>"सच्चालीस", 48=>"अठचालीस", 49=>"उनन्चास", 50=>"पचास", 51=>"एकाउन्न", 52=>"बाउन्न", 53=>"त्रिपन्न", 54=>"चउन्न", 55=>"पचपन्न", 56=>"छपन्न", 57=>"सन्ताउन्न", 58=>"अन्ठाउन्न", 59=>"उनन्साठी", 60=>"साठी", 61=>"एकसट्ठी", 62=>"बयसट्ठी", 63=>"त्रिसट्ठी", 64=>"चौंसट्ठी", 65=>"पैंसट्ठी", 66=>"छयसट्ठी", 67=>"सतसट्ठी", 68=>"अठसट्ठी", 69=>"उनन्सत्तरी", 70=>"सत्तरी", 71=>"एकहत्तर", 72=>"बहत्तर", 73=>"त्रिहत्तर", 74=>"चौहत्तर", 75=>"पचहत्तर", 76=>"छयहत्तर", 77=>"सतहत्तर", 78=>"अठहत्तर", 79=>"उनासी", 80=>"असी", 81=>"एकासी", 82=>"बयासी", 83=>"त्रियासी", 84=>"चौरासी", 85=>"पचासी", 86=>"छयासी", 87=>"सतासी", 88=>"अठासी", 89=>"उनान्नब्बे", 90=>"नब्बे", 91=>"एकान्नब्बे", 92=>"बयानब्बे", 93=>"त्रियान्नब्बे", 94=>"चौरान्नब्बे", 95=>"पन्चानब्बे", 96=>"छयान्नब्बे", 97=>"सन्तान्नब्बे", 98=>"अन्ठान्नब्बे", 99=>"उनान्सय", 100=>"एक सय"}
  DIVISIONS = ["","हजार"]

  
def to_akshar
	#return "रुपैयाँ  " + self.to_nepali + " मात्र । "
	if (self.to_nepali == false )
		result = "Impossible Number | Check your Input" 
	else
		result =  "रुपैयाँ  " + self.to_nepali + " मात्र ।"
	end

	return result.gsub(", पैसा  शुन्य", '')
	
end

  def to_nepali
 

  	string = self.to_s.gsub(/\s+/, "")

  	decimalcheck =  string.index('.')
  	if (decimalcheck != nil ) 
  		#return "Decimal Number Detected" + decimalcheck.to_s
  		paisa =  string[decimalcheck+1 .. decimalcheck+2 ]
  	else
  		paisa = "0"
  	end
    num = self.to_i
    num, sign = check_sign(num)
    return (sign + SMALL_NUMBERS[num]) if num <= 100
    counter = 0
    result = []
    while num != 0
		if (num > 10000000000000000)
    		return false
    	elsif ((num / 1000000000000000) >= 1)
    		test , remaining  = num.divmod(1000000000000000)
    		return ((sign + SMALL_NUMBERS[test]) +" पद्म "+ (remaining.to_s+ "."+ paisa).to_nepali )
       	elsif ((num / 10000000000000) >= 1)
    		test , remaining  = num.divmod(10000000000000)
    		return ((sign + SMALL_NUMBERS[test]) +" नील "+ (remaining.to_s+"."+paisa).to_nepali )
    	elsif ((num / 100000000000) >= 1)
    		test , remaining  = num.divmod(100000000000)
    		return ((sign + SMALL_NUMBERS[test]) +" खर्ब "+ (remaining.to_s+"."+paisa).to_nepali )
    	elsif ((num / 1000000000) >= 1)
    		test , remaining  = num.divmod(1000000000)
    	return ((sign + SMALL_NUMBERS[test]) +" अर्ब "+ (remaining.to_s+"."+paisa).to_nepali )
    	elsif ((num / 10000000) >= 1)
    		test , remaining  = num.divmod(10000000)
    	return ((sign + SMALL_NUMBERS[test]) +" करोड "+ (remaining.to_s+"."+paisa).to_nepali )
    	elsif ((num / 100000) >= 1)
    		test , remaining  = num.divmod(100000)
    	return ((sign + SMALL_NUMBERS[test]) +" लाख "+ (remaining.to_s+"."+paisa).to_nepali )

    	end 
    		
      num, remaining = num.divmod(1000)
      
      temp_result = result_below_one_thousand(remaining, counter)
      result << temp_result + " " + DIVISIONS[counter] + "" if temp_result != ''
      counter += 1
    end
    return sign + result.reverse.join(" ").rstrip + ", पैसा  " + paisa.to_i.to_nepali 
  end

   

  def result_below_one_thousand(num, counter)
    hundred, remaining = num.divmod(100)
    #return SMALL_NUMBERS[hundred] + " सय " + SMALL_NUMBERS[remaining]     if hundred != 0 && remaining != 0 && counter != 0
    return SMALL_NUMBERS[hundred] + " सय " + SMALL_NUMBERS[remaining] if hundred != 0 && remaining != 0
    return SMALL_NUMBERS[remaining]                                            if hundred == 0 && remaining != 0
    return SMALL_NUMBERS[hundred] + " सय "                                if hundred != 0 && remaining == 0
    return ''
  end

  def check_sign(num)
    return num < 0 ? ([num.abs, 'ॠणात्मक ']) : ([num, ''])
  end

  end


class Fixnum
	include ToAkshar
end

class Float
	include ToAkshar
end

class String
	include ToAkshar
end

class Bignum
	include ToAkshar
end
