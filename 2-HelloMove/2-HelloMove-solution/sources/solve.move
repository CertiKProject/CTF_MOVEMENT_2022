module attack::solve1 {
    use std::signer;
    use std::vector;
    use ctfmovement::hello_move::{Self};

    public entry fun solve(attacker: &signer) {

        hello_move::init_challenge(attacker);

        // puzzel 1
        let guess:vector<u8> = vector[103, 111, 111, 100];
        hello_move::hash(attacker, guess);
    
        // puzzel 2
        hello_move::discrete_log(attacker, 3123592912467026955);

        // puzzel 3
        let i = 0;
        loop{
                hello_move::add(attacker, 3, 1);
                i = i + 1;
                if(i == 63){
                    break
                }
        };

        hello_move::get_flag(attacker);

    }

}