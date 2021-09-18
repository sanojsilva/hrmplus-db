import { OfferTerm } from "@prisma/client";

const offerTerms: Partial<OfferTerm>[] = [
  {
    id: 1,
    term: "Incentives",
    description: "",
  },
  {
    id: 2,
    term: "Notice Period",
    description:
      "This Agreement shall become and shall remain in effect until terminated by either party giving sixty (60) days' prior written notice of termination to the other party.",
  },
  {
    id: 3,
    term: "Leaves Per Year",
    description: "",
  },
  {
    id: 4,
    term: "Responsibilities",
    description:
      "You will be required to perform duties the Company may assign to you in relation to the Company",
  },
  {
    id: 5,
    term: "Job Description",
    description: "",
  },
  {
    id: 6,
    term: "Anuual Salary",
    description:
      "You will be paid an all-inclusive allowance of LKR 215,000/- per year.",
  },
  {
    id: 7,
    term: "Working Hours",
    description:
      "Working hours will start from 8.30AM - 5.30PM in Standard Time",
  },
  {
    id: 8,
    term: "Employee Benefits",
    description: "",
  },
  {
    id: 9,
    term: "Probationary Period",
    description: "Employee will be Allocated 1 month ",
  },
  {
    id: 10,
    term: "Salary Payment",
    description:
      "Payments will be carried out monthly for a designated bank account.",
  },
  {
    id: 11,
    term: "Date of Joining",
    description: "",
  },
];

export default offerTerms;
