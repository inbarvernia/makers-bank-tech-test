| Nouns        | Property or owner of property?                           |
| ------------ | -------------------------------------------------------- |
| Account      | owner                                                    |
| Statement    | property of account                                      |
| Transactions | property of account                                      |
| Balance      | property of account and also each individual transaction |
| Date         | property of transaction                                  |
| Amount       | property of transaction                                  |

| Actions         | Owned by? |
| --------------- | --------- |
| deposit         | account   |
| withdraw        | account   |
| print_statement | account   |

| Actions         | Property it reads or changes                    |
| --------------- | ----------------------------------------------- |
| deposit         | changes transactions, reads and changes balance |
| withdraw        | changes transactions, reads and changes balance |
| print_statement | reads transactions                              |

| Class (Owner)                   | Account                             |
| ------------------------------- | ----------------------------------- |
| Properties (instance variables) | transactions (array), balance (int) |
| Actions (methods)               | deposit, withdraw, print_statement  |

Next steps:

- TDD transactions being stored differently for withdrawals and deposite - either using +/- for amount, or adding a type = 'deposit'/'withdrawal' to transaction hashes
- Test print_statement with multiple transactions to make sure it reverses order
