package com.sist.last.service;

import java.sql.SQLException;
import java.util.List;

import com.sist.last.cmn.DTO;

public interface BasketService {
	/**
	 * 목록조회
	 * @param dto
	 * @return List<?>
	 * @throws SQLException
	 */
	List<?> doRetrieve(DTO dto)throws SQLException;
	
	/**
	 * 단건조회
	 * @param DTO
	 * @return DTO
	 * @throws SQLException
	 */
	DTO doSelectOne(DTO dto) throws SQLException;
	
	/**
	 * 수정
	 * @param DTO
	 * @return int(1:성공,0:실패)
	 * @throws SQLException
	 */
	int  doUpdate(DTO dto)throws SQLException;
	
	/**
	 * 삭제
	 * @param DTO
	 * @return int(1:성공,0:실패)
	 * @throws SQLException
	 */
	int doDelete(DTO dto) throws  SQLException;
	
	/**
	 * 등록
	 * @param dto
	 * @return
	 * @throws SQLException
	 */
	int doInsert(DTO dto) throws SQLException;
	
	
	/**
	 * 장바구니 상품 중복 체크
	 * @param dto
	 * @return
	 * @throws SQLException
	 */
	int basketCheck(DTO dto) throws SQLException;
	
}
