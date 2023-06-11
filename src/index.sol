// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract WEE is AccessControl {
    bytes32 public constant INSTITUTION = keccak256("INSTITUTION");
    bytes32 public constant INDIVIDUAL = keccak256("INDIVIDUAL");

    struct Work {
        address location;
        string locationString;
        string role;
        uint256 startTime;
        uint256 endTime;
        bool verified;
    }

    struct Education {
        address institution;
        string institutionString;
        string degree;
        uint256 startTime;
        uint256 endTime;
        bool verified;
    }

    struct Experience {
        address company;
        string companyString;
        string role;
        uint256 startTime;
        uint256 endTime;
        bool verified;
    }

    mapping(address => Work) public workMap;
    mapping(address => Education) public educationMap;
    mapping(address => Experience) public experienceMap;

    event WorkSet(
        address indexed whose,
        address indexed location,
        string locationString,
        string role,
        uint256 startTime,
        uint256 endTime
    );
    event EducationSet(
        address indexed whose,
        address indexed institution,
        string institutionString,
        string degree,
        uint256 startTime,
        uint256 endTime
    );
    event ExperienceSet(
        address indexed whose,
        address indexed company,
        string companyString,
        string role,
        uint256 startTime,
        uint256 endTime
    );
    event WorkVerified(address indexed whose);
    event EducationVerified(address indexed whose);
    event ExperienceVerified(address indexed whose);

    modifier validAddress(address addr) {
        require(addr != address(0), "Invalid address");
        _;
    }

    constructor() {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(INSTITUTION, msg.sender);
    }

    function setWork(
        address whose,
        address location,
        string memory locationString,
        string memory role,
        uint256 startTime,
        uint256 endTime
    ) public onlyRole(INDIVIDUAL) validAddress(location) {
        require(startTime < endTime, "Invalid time period");

        Work storage work = workMap[whose];
        work.location = location;
        work.locationString = locationString;
        work.role = role;
        work.startTime = startTime;
        work.endTime = endTime;

        emit WorkSet(whose, location, locationString, role, startTime, endTime);
    }

    function setEducation(
        address whose,
        address institution,
        string memory institutionString,
        string memory degree,
        uint256 startTime,
        uint256 endTime
    ) public onlyRole(INDIVIDUAL) validAddress(institution) {
        require(startTime < endTime, "Invalid time period");

        Education storage education = educationMap[whose];
        education.institution = institution;
        education.institutionString = institutionString;
        education.degree = degree;
        education.startTime = startTime;
        education.endTime = endTime;

        emit EducationSet(
            whose,
            institution,
            institutionString,
            degree,
            startTime,
            endTime
        );
    }

    function setExperience(
        address whose,
        address company,
        string memory companyString,
        string memory role,
        uint256 startTime,
        uint256 endTime
    ) public onlyRole(INDIVIDUAL) validAddress(company) {
        require(startTime < endTime, "Invalid time period");

        Experience storage experience = experienceMap[whose];
        experience.company = company;
        experience.companyString = companyString;
        experience.role = role;
        experience.startTime = startTime;
        experience.endTime = endTime;

        emit ExperienceSet(
            whose,
            company,
            companyString,
            role,
            startTime,
            endTime
        );
    }

    function getWork(
        address whose
    )
        public
        view
        returns (
            address location,
            string memory locationString,
            string memory role,
            uint256 startTime,
            uint256 endTime,
            bool verified
        )
    {
        Work storage work = workMap[whose];
        return (
            work.location,
            work.locationString,
            work.role,
            work.startTime,
            work.endTime,
            work.verified
        );
    }

    function getEducation(
        address whose
    )
        public
        view
        returns (
            address institution,
            string memory institutionString,
            string memory degree,
            uint256 startTime,
            uint256 endTime,
            bool verified
        )
    {
        Education storage education = educationMap[whose];
        return (
            education.institution,
            education.institutionString,
            education.degree,
            education.startTime,
            education.endTime,
            education.verified
        );
    }

    function getExperience(
        address whose
    )
        public
        view
        returns (
            address company,
            string memory companyString,
            string memory role,
            uint256 startTime,
            uint256 endTime,
            bool verified
        )
    {
        Experience storage experience = experienceMap[whose];
        return (
            experience.company,
            experience.companyString,
            experience.role,
            experience.startTime,
            experience.endTime,
            experience.verified
        );
    }

    function verifyEducation(
        address whose
    ) public onlyRole(INSTITUTION) returns (bool) {
        require(
            educationMap[whose].institution == msg.sender,
            "Unauthorized verification"
        );
        educationMap[whose].verified = true;

        emit EducationVerified(whose);
        return true;
    }

    function verifyWork(
        address whose
    ) public onlyRole(INSTITUTION) returns (bool) {
        require(
            workMap[whose].location == msg.sender,
            "Unauthorized verification"
        );
        workMap[whose].verified = true;

        emit WorkVerified(whose);
        return true;
    }

    function verifyExperience(
        address whose
    ) public onlyRole(INSTITUTION) returns (bool) {
        require(
            experienceMap[whose].company == msg.sender,
            "Unauthorized verification"
        );
        experienceMap[whose].verified = true;

        emit ExperienceVerified(whose);
        return true;
    }
}
