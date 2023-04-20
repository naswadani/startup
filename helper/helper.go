package helper

import "github.com/go-playground/validator/v10"

type Response struct {
	Meta Meta        `json:"meta"`
	Data interface{} `json:"data"`
}

type Meta struct {
	Massage string `json:"massage"`
	Code    int    `json:"code"`
	Status  string `json:"status"`
}

func APIResponse(massage string, code int, status string, data interface{}) Response {
	meta := Meta{
		Massage: massage,
		Code:    code,
		Status:  status,
	}

	respons := Response{
		Meta: meta,
		Data: data,
	}
	return respons
}

func ErrorFormater(err error) []string {
	var errors []string
	for _, e := range err.(validator.ValidationErrors) {
		errors = append(errors, e.Error())
	}
	return errors
}
