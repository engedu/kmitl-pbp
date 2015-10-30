package com.buckwa.service.impl.pam;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.buckwa.dao.intf.pam.PaperDao;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.common.PagingBean;
import com.buckwa.domain.pam.Paper;
import com.buckwa.service.intf.pam.PaperService;
import com.buckwa.util.BuckWaConstants;

/*
@Author : Taechapon Himarat (Su)
@Create : Aug 6, 2012 12:40:01 AM
 */
@Service("paperService")
public class PaperServiceImpl implements PaperService {
	
	private static Logger logger = Logger.getLogger(PaperServiceImpl.class);
	
	
	@Autowired
	private PaperDao paperDao;
	
	
	@Override
	public BuckWaResponse getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BuckWaResponse getByOffset(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try {
			logger.info("PaperServiceImpl.getByOffset");
			PagingBean pagingBean = (PagingBean) request.get("pagingBean");
			PagingBean returnBean = paperDao.getByOffset(pagingBean);
			response.addResponse("pagingBean", returnBean);
		}
		catch (Exception ex) {
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");
		}
		return response;
	}

	@Override
	public BuckWaResponse getById(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try {
			logger.info(" PaperServiceImpl.getById");
			String id =  String.valueOf(request.get("id"));
			Paper paper = paperDao.getById(id);
			if (paper != null) {
				response.addResponse("paper", paper);
				response.setStatus(BuckWaConstants.SUCCESS);
			}
			else {
				response.setStatus(BuckWaConstants.FAIL);
				response.setErrorCode("E001");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");
		}
		return response;
	}
	
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse create(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try {
			logger.info(" PaperServiceImpl.create");
			Paper domain = (Paper) request.get("domain");
			paperDao.create(domain);
			response.setStatus(BuckWaConstants.SUCCESS);
		}
		catch(Exception e) {
			e.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
	
	
	@Override
	public BuckWaResponse update(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try {
			logger.info(" PaperServiceImpl.update");
			Paper domain = (Paper) request.get("domain");
			paperDao.update(domain);
			response.setStatus(BuckWaConstants.SUCCESS);
		}
		catch(Exception e) {
			e.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
	
	
	@Override
	public BuckWaResponse deleteById(BuckWaRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}
