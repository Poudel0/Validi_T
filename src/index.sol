// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

contract WEE {
    struct Work {
        address a_where;
        string s_where;
        string s_what;
        uint256 start_timestamp;
        uint256 end_timestamp;
    }
    struct Education {
        address a_where;
        string s_where;
        string s_what;
        uint256 start_timestamp;
        uint256 end_timestamp;
    }
    struct Experience {
        address a_where;
        string s_where;
        string s_what;
        uint256 start_timestamp;
        uint256 end_timestamp;
    }
    // constructor() {

    // }

    // Mapping defined
    mapping(address => Work) public Workmap;
    mapping(address => Education) public Educationmap;
    mapping(address => Experience) public Experiencemap;

    //Setter functions

    function setWork(
        address whose,
        address where,
        string memory swhere,
        string memory what,
        uint256 start,
        uint256 end
    ) public {
        Workmap[whose].a_where = where;
        Workmap[whose].s_where = swhere;
        Workmap[whose].s_what = what;
        Workmap[whose].start_timestamp = start;
        Workmap[whose].end_timestamp = end;
    }

    function setEducation(
        address whose,
        address where,
        string memory swhere,
        string memory what,
        uint256 start,
        uint256 end
    ) public {
        Educationmap[whose].a_where = where;
        Educationmap[whose].s_where = swhere;
        Educationmap[whose].s_what = what;
        Educationmap[whose].start_timestamp = start;
        Educationmap[whose].end_timestamp = end;
    }

    function setExperience(
        address whose,
        address where,
        string memory swhere,
        string memory what,
        uint256 start,
        uint256 end
    ) public {
        Experiencemap[whose].a_where = where;
        Experiencemap[whose].s_where = swhere;
        Experiencemap[whose].s_what = what;
        Experiencemap[whose].start_timestamp = start;
        Experiencemap[whose].end_timestamp = end;
    }

    //Getter functions

    function getWork(
        address whose
    )
        public
        view
        returns (
            address ad_where,
            string memory st_where,
            string memory st_what,
            uint256 start_time,
            uint256 end_time
        )
    {
        ad_where = Workmap[whose].a_where;
        st_where = Workmap[whose].s_where;
        st_what = Workmap[whose].s_what;
        start_time = Workmap[whose].start_timestamp;
        end_time = Workmap[whose].end_timestamp;
    }

    function getEducation(
        address whose
    )
        public
        view
        returns (
            address ad_where,
            string memory st_where,
            string memory st_what,
            uint256 start_time,
            uint256 end_time
        )
    {
        ad_where = Educationmap[whose].a_where;
        st_where = Educationmap[whose].s_where;
        st_what = Educationmap[whose].s_what;
        start_time = Educationmap[whose].start_timestamp;
        end_time = Educationmap[whose].end_timestamp;
    }

    function getExperience(
        address whose
    )
        public
        view
        returns (
            address ad_where,
            string memory st_where,
            string memory st_what,
            uint256 start_time,
            uint256 end_time
        )
    {
        ad_where = Experiencemap[whose].a_where;
        st_where = Experiencemap[whose].s_where;
        st_what = Experiencemap[whose].s_what;
        start_time = Experiencemap[whose].start_timestamp;
        end_time = Experiencemap[whose].end_timestamp;
    }

    // function geta_where(address whose) public view returns (address) {
    //     return WORKmap[whose].a_where;
    // }

    // function gets_where(address whose) public view returns (string memory) {
    //     return WORKmap[whose].s_where;
    // }

    // function gets_what(address whose) public view returns (string memory) {
    //     return WORKmap[whose].s_what;
    // }

    // function get_start(address whose) public view returns (uint256) {
    //     return WORKmap[whose].start_timestamp;
    // }

    // function get_end(address whose) public view returns (uint256) {
    //     return WORKmap[whose].end_timestamp;
    // }
}
