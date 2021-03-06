class Tx:
    def __init__(self, version, tx_ins, tx_outs, locktime, testnet=False):
        self.version = version
        self.tx_outs = tx_outs
        self.tx_ins = tx_ins
        self.locktime = locktime
    
    def __repr__(self):
        tx_ins = ''
        for tx_in in self.tx_ins:
            tx_ins += tx_in.__repr__() + '\n'
        tx_outs = ''
        for tx_out in self.tx_outs:
            tx_outs += tx_out.__repr__() + '\n'
        
        return 'tx:{}\nversion:{}\ntx_ins:\n{}tx_outs:\n{}locktime:{}'.format(
            self.id(), self.version,tx_ins, tx_outs, self.locktime,
        )

    def id(self):
        '''Human readable hexadecimal of the transaction hash'''
        return self.hash().hex()
    
    def hash(self):
        return hash256(self.serialize())[::-1]
