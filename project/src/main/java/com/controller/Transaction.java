package com.controller;

import java.sql.Timestamp;

public class Transaction {

    
    private String transaction_id;
	private int account;
	private Timestamp transaction_date;
	private String transaction_type;
	private double amount;
	private int receiver;
    
    public Transaction() {
    }

	public String getTransaction_id() {
		return transaction_id;
	}

	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}

	public int getAccount() {
		return account;
	}

	public void setAccount(int account) {
		this.account = account;
	}

	public Timestamp getTransaction_date() {
		return transaction_date;
	}

	public void setTransaction_date(Timestamp transaction_date) {
		this.transaction_date = transaction_date;
	}

	public String getTransaction_type() {
		return transaction_type;
	}

	public void setTransaction_type(String transaction_type) {
		this.transaction_type = transaction_type;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public int getReceiver() {
		return receiver;
	}

	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}

	
}
