import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CitizenDatabase {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/your_database_name"; // Update with your database URL
    private static final String USER = "your_username"; // Update with your database username
    private static final String PASSWORD = "your_password"; // Update with your database password

    public static void main(String[] args) {
        CitizenDatabase db = new CitizenDatabase();
        db.getCitizensWithLandAreaGreaterThanOne();
        db.getFemaleCitizensWithLowIncome();
        db.getTotalRiceLand();
        db.getCitizenCountWithQualification();
        db.getPanchayatEmployeesWithLand();
        db.getPradhanFamily();
        db.getTotalStreetLightsIn2024();
        db.getTotalVaccinationsFor10thGraders();
        db.getBoyBirthsIn2024();
        db.getCitizensInPanchayatHouseholds();
    }

    private Connection connect() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
        } catch (SQLException e) {
            System.out.println("Connection failed: " + e.getMessage());
        }
        return conn;
    }

    public void getCitizensWithLandAreaGreaterThanOne() {
        String sql = "SELECT c.name FROM citizens c JOIN land_records l ON c.citizen_id = l.citizen_id WHERE l.area_acres > 1";
        try (Connection conn = connect(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                System.out.println("Citizen with land area > 1 acre: " + rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getFemaleCitizensWithLowIncome() {
        String sql = "SELECT c.name FROM citizens c JOIN households h ON c.household_id = h.household_id WHERE c.gender = 'Female' AND h.income < 100000";
        try (Connection conn = connect(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                System.out.println("Female citizen with low income: " + rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getTotalRiceLand() {
        String sql = "SELECT SUM(l.area_acres) AS total_rice_land FROM land_records l WHERE l.crop_type = 'Rice'";
        try (Connection conn = connect(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                System.out.println("Total rice land area: " + rs.getDouble("total_rice_land"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getCitizenCountWithQualification() {
        String sql = "SELECT COUNT(*) AS citizen_count FROM citizens WHERE dob > '2000-01-01' AND educational_qualification = '10th'";
        try (Connection conn = connect(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                System.out.println("Citizen count with 10th qualification: " + rs.getInt("citizen_count"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getPanchayatEmployeesWithLand() {
        String sql = "SELECT c.name FROM panchayat_employees p JOIN citizens c ON p.citizen_id = c.citizen_id JOIN land_records l ON c.citizen_id = l.citizen_id WHERE l.area_acres > 1";
        try (Connection conn = connect(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                System.out.println("Panchayat employee with land area > 1 acre: " + rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getPradhanFamily() {
        String sql = "SELECT c.name AS Pradhan_family FROM citizens c JOIN households h ON c.household_id = h.household_id WHERE c.household_id = (SELECT c.household_id FROM citizens c JOIN panchayat_employees p ON c.citizen_id = p.citizen_id WHERE p.role = 'Pradhan')";
        try (Connection conn = connect(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                System.out.println("Pradhan family member: " + rs.getString("Pradhan_family"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getTotalStreetLightsIn2024() {
        String sql = "SELECT COUNT(*) AS total_street_lights_in2024 FROM assets WHERE type = 'Street Light' AND location = 'Phulera' AND YEAR(installation_date) = 2024";
        try (Connection conn = connect(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                System.out.println("Total street lights in 2024: " + rs.getInt("total_street_lights_in2024"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getTotalVaccinationsFor10thGraders() {
        String sql = "SELECT COUNT(*) AS total_vaccinations FROM vaccinations v JOIN citizens c ON v.citizen_id = c.citizen_id WHERE c.educational_qualification = '10th' AND YEAR(v.date_administered) = 2024";
        try (Connection conn = connect(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                System.out.println("Total vaccinations for 10th graders in 2024: " + rs.getInt("total_vaccinations"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getBoyBirthsIn2024() {
        String sql = "SELECT COUNT(*) AS boy_births FROM citizens WHERE gender = 'Male' AND YEAR(dob) = 2024";
        try (Connection conn = connect(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                System.out.println("Total boy births in 2024: " + rs.getInt("boy_births"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getCitizensInPanchayatHouseholds() {
        String sql = "SELECT COUNT(DISTINCT c.citizen_id) AS citizens_in_panchayat_households FROM citizens c JOIN households h ON c.household_id = h.household_id WHERE h.household_id IN (SELECT DISTINCT c2.household_id FROM citizens c2 JOIN panchayat_employees p ON c2.citizen_id = p.citizen_id)";
        try (Connection conn = connect(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                System.out.println("Total citizens in panchayat households: " + rs.getInt("citizens_in_panchayat_households"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}