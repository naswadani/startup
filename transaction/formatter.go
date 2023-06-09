package transaction

import (
	"time"
)

type CampaignTransactionFormatter struct {
	ID        int       `json:"id"`
	Name      string    `json:"name"`
	Amount    int       `json:"amount"`
	CreatedAt time.Time `json:"created_at"`
}

func FormatCampaignTransaction(transaction Transaction) CampaignTransactionFormatter {
	formatter := CampaignTransactionFormatter{}
	formatter.ID = transaction.ID
	formatter.Name = transaction.User.Name
	formatter.Amount = transaction.Amount
	formatter.CreatedAt = transaction.CreatedAt
	return formatter
}

func FormatCampaignTransactions(transactions []Transaction) []CampaignTransactionFormatter {
	if len(transactions) == 0 {
		return []CampaignTransactionFormatter{}
	}
	var transactionsFormatter []CampaignTransactionFormatter
	for _, transaction := range transactions {
		formatter := FormatCampaignTransaction(transaction)
		transactionsFormatter = append(transactionsFormatter, formatter)
	}
	return transactionsFormatter
}

type UserTransactionsFormatter struct {
	ID        int               `json:"id"`
	Amount    int               `json:"amount"`
	Status    string            `json:"status"`
	CreatedAt time.Time         `json:"created_at"`
	Campaign  CampaignFormatter `json:"campaign"`
}
type CampaignFormatter struct {
	Name     string `json:"name"`
	ImageUrl string `json:"image_url"`
}

func FormatUserTransaction(transaction Transaction) UserTransactionsFormatter {

	formatter := UserTransactionsFormatter{}
	formatter.ID = transaction.ID
	formatter.Amount = transaction.Amount
	formatter.Status = transaction.Status
	formatter.CreatedAt = transaction.CreatedAt

	campaignformatter := CampaignFormatter{}
	campaignformatter.Name = transaction.Campaign.Name

	if len(transaction.Campaign.CampaignImages) > 0 {
		campaignformatter.ImageUrl = transaction.Campaign.CampaignImages[0].FileName
	}
	formatter.Campaign = campaignformatter
	return formatter
}

func FormatUserTransactions(transactions []Transaction) []UserTransactionsFormatter {
	if len(transactions) == 0 {
		return []UserTransactionsFormatter{}
	}
	var transactionsFormatter []UserTransactionsFormatter
	for _, transaction := range transactions {
		formatter := FormatUserTransaction(transaction)
		transactionsFormatter = append(transactionsFormatter, formatter)
	}
	return transactionsFormatter
}
