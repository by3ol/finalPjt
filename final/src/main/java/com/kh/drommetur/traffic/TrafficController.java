package com.kh.drommetur.traffic;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TrafficController {

	@RequestMapping("traffic.t")
	public String trafficView() {
		return "traffic/traffic";
	}
}
