// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Jokenpo {
    address public owner;
    address public jogador1;
    address public jogador2;

    enum Movimento {Pedra, Papel, Tesoura}
    enum Resultado {Draw, Jogador1Vence, Jogador2Vence}

    //mapping que associa um endereço a um movimento
    mapping(address => Movimento) public movimentos;

    //mapping para saber o resultado de um jogador
    mapping(address => bool) public jogadores;

    Resultado public resultado;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Apenas o dono pode executar isso.");
        _;
    }

    modifier onlyPlayers() {
        require(jogadoresRegistrados[msg.sender], "Voce nao esta registrado.");
        _;
    }

    function jogadoresRegistrados(address _jogador1, address _jogador2) external onlyOwner {
        jogador1 = _jogador1;
        jogador2 = _jogador1;
        jogadoresRegistrados[_jogador1] = true;
        jogadoresRegistrados[_jogador2] = true;
        resetMoves();
    }
}
