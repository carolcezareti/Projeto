package br.usjt.projeto.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.usjt.projeto.dao.SubServicoDAO;
import br.usjt.projeto.entity.Servico;
import br.usjt.projeto.entity.SubServico;

@Service
public class SubServicoService {

	@Autowired
	private SubServicoDAO dao;
	
	public List<SubServico> carregaSubServicos(){
		return dao.carregaSubServicos();
	}

	public List<SubServico> carregarByServico(Servico servico) {
		return dao.carregarByServico(servico);
	}
	
	public SubServico carregar(int subServico) {
		return dao.carregarById(subServico);
	}
	
	public List<SubServico> carregarSubServicos() {
		return dao.carregaSubServicos();
	}
	
}
