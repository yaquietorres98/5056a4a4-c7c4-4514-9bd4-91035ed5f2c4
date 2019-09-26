import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


class Amortization(object):

    def __init__(self, amount, interest, n):
        self.amount = amount
        self.interest = interest
        self.n = n

    @property
    def annuity(self):
        annuity = self.amount / ((1 - (1 + self.interest) ** (-self.n)) / self.interest)
        return annuity

    def get_table(self):
        rows = []
        loan_value = self.amount
        payment= self.annuity
        for i in range (self.n):
            interest_value = loan_value * self.interest
            principal = payment - interest_value
            loan_value = loan_value - principal
            rows.append({
                "interest": interest_value,
                "payment": payment,
                "principal": principal,
                "loan_value": loan_value
            })
        return pd.DataFrame(rows).rename_axis("period").reset_index()

    def get_plot(self):
        df=self.get_table()
        plot = df.plot.bar(x="perios", y=["principal","interest"], stacked=TRUE)
        fig = plot.get_figure()
        plt.show()
        return fig




        plt.subplot(2, 2, 1)
        plt.plot(list(np.arange(self.n) + 1), list(table.iloc[1:, 0]))
        plt.title('Principal')
        plt.xlabel('Periods')
        plt.ylabel('Amount $')
        plt.subplot(2, 2, 2)
        plt.plot(list(np.arange(self.n) + 1), list(table.iloc[1:, 1]))
        plt.title('Interest')
        plt.xlabel('Periods')
        plt.ylabel('Interest $')
        plt.subplot(2, 2, 3)
        plt.plot(list(np.arange(self.n) + 1), list(table.iloc[1:, 2]))
        plt.title('Annuity')
        plt.xlabel('Periods')
        plt.ylabel('Annuity $')
        plt.subplot(2, 2, 4)
        plt.plot(list(np.arange(self.n) + 1), list(table.iloc[1:, 3]))
        plt.title('Loan Value')
        plt.xlabel('Periods')
        plt.ylabel('Loan Value $')
        plt.show()
        return fig

