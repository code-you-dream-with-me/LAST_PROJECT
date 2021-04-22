package com.sist.last.service;

import java.sql.SQLException;
import java.util.List;

import com.sist.last.cmn.DTO;

public interface ImageService {

	/**
	 * 목록조회
	 * 
	 * @param review
	 * @return List<Review>
	 * @throws SQLException
	 */
	public List<?> doRetrieve(DTO dto) throws SQLException;

	/**
	 * 단건조회
	 * 
	 * @param dto
	 * @return DTO
	 * @throws SQLException
	 */
	DTO doSelectOne(DTO dto) throws SQLException;

	/**
	 * 수정
	 * 
	 * @param dto
	 * @return int(1:성공/0:실패)
	 * @throws SQLException
	 */
	int doUpdate(DTO dto) throws SQLException;

	/**
	 * 삭제 예외, 자원반납: JdbcTemplate 내부로 이동 query, param 처리
	 * 
	 * @param dto
	 * @return int(성공:1, 실패:0)
	 * @throws SQLException
	 */
	int doDelete(DTO dto) throws SQLException;

	/**
	 * 이미지 등록
	 * 
	 * @param dto
	 * @return int(성공:1, 실패:0)
	 * @throws SQLException
	 */
	int doInsert(DTO dto) throws SQLException;

}
