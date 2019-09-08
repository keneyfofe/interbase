package za.co.interbase.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

/**
 *
 * @author keneyfofe
 */
@Entity
@Table(name = "accounts", catalog = "inter_base", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Accounts.findAll", query = "SELECT a FROM Accounts a"),
    @NamedQuery(name = "Accounts.findByCode", query = "SELECT a FROM Accounts a WHERE a.code = :code"),
    @NamedQuery(name = "Accounts.findByAccountNumber", query = "SELECT a FROM Accounts a WHERE a.accountNumber = :accountNumber"),
    @NamedQuery(name = "Accounts.findByOutstandingBalance", query = "SELECT a FROM Accounts a WHERE a.outstandingBalance = :outstandingBalance"),
    @NamedQuery(name = "Accounts.findByStatus", query = "SELECT a FROM Accounts a WHERE a.status = :status")})
public class Accounts implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "code")
    private Integer code;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "account_number")
    private String accountNumber;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "outstanding_balance")
    private BigDecimal outstandingBalance;
    @Basic(optional = false)
    @NotNull
    @Column(name = "status")
    private boolean status;
    @JsonBackReference
    @JoinColumn(name = "person_code", referencedColumnName = "code")
    @ManyToOne(optional = false)
    private Persons personCode;
    @JsonManagedReference
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "accountCode")
    private List<Transactions> transactionsList;

    public Accounts() {
    }

    public Accounts(Integer code) {
        this.code = code;
    }

    public Accounts(Integer code, String accountNumber, BigDecimal outstandingBalance, boolean status) {
        this.code = code;
        this.accountNumber = accountNumber;
        this.outstandingBalance = outstandingBalance;
        this.status = status;
    }
    
    public Accounts(String accountNumber, BigDecimal outstandingBalance, boolean status) {
        this.accountNumber = accountNumber;
        this.outstandingBalance = outstandingBalance;
        this.status = status;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public BigDecimal getOutstandingBalance() {
        return outstandingBalance;
    }

    public void setOutstandingBalance(BigDecimal outstandingBalance) {
        this.outstandingBalance = outstandingBalance;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Persons getPersonCode() {
        return personCode;
    }

    public void setPersonCode(Persons personCode) {
        this.personCode = personCode;
    }

    @XmlTransient
    public List<Transactions> getTransactionsList() {
        return transactionsList;
    }

    public void setTransactionsList(List<Transactions> transactionsList) {
        this.transactionsList = transactionsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (code != null ? code.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Accounts)) {
            return false;
        }
        Accounts other = (Accounts) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.co.interactive.entity.Accounts[ code=" + code + " ]";
    }
    
}
