package com.wed.dto;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartItemDto {
	
	@NotNull(message="상품 아이디는 필수항목입니다.")
	private Long itemId;
	
	@Min(value=1, message="최소 1개 이상 담아주세요.")
	private int count;
}
