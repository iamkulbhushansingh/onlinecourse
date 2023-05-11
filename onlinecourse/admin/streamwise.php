<?php
session_start();
include('includes/config.php');
error_reporting(0);
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{

    if(isset($_POST['submit'])) {
        $stream_id = $_POST['stream_id'];
// echo ($stream_id);

        $sqln = mysqli_query($con, "SELECT stream_name FROM stream WHERE stream_id='$stream_id'");
        $rown = mysqli_fetch_array($sqln);
        $stream_name=$rown['stream_name'];

        // echo ($stream_name); 

        // Fetch student registration numbers and names from database
        $sql1 = mysqli_query($con, "SELECT studentRegno,studentName FROM students WHERE stream_id='$stream_id'");
    
        $students = array();
    
        while ($row = mysqli_fetch_array($sql1)) {
            // var_dump ($row);
            $sql2 = mysqli_query($con, "SELECT course_code,course_name FROM courses_allocated WHERE student_reg_no='".$row['studentRegno']."'");
            
    while($row2 = mysqli_fetch_array($sql2)){
            $students[] = array('reg_no' => $row['studentRegno'], 'name' => $row['studentName'], 'coursecode'=>  $row2['course_code'], 'coursename'=>  $row2['course_name'] );
        }
    }
    
        // Generate CSV file
        header('Content-Type: text/csv; charset=utf-8');
        header('Content-Disposition: attachment; filename='.$stream_name.'.csv');
    
        $output = fopen('php://output', 'w');
        fputcsv($output, array('Student Reg No', 'Name', 'Course Code', 'Course Name'));
    
        foreach ($students as $student) {
            fputcsv($output, $student);
        }
    
        fclose($output);
        exit();
    
 }
    
    
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Student Profile</title>
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <link href="../assets/css/style.css" rel="stylesheet" />
</head>

<body>
<?php include('includes/header.php');?>
    <!-- LOGO HEADER END-->
<?php if($_SESSION['alogin']!="")
{
 include('includes/menubar.php');
}
 ?>
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
              <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Student Registration  </h1>
                    </div>
                </div>
                <div class="row" >
                  <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                        <div class="panel-heading">
                          Student Registration
                        </div>
<font color="green" align="center"><?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?></font>





                        <div class="panel-body">
                       <form method="post" >
                       <div class="form-group">
    <label for="stream_name">Select Stream</label>
    <select class="form-control" name="stream_id" required="required" onchange="getCourseCode()">
        <option value="">Select Stream Name</option>
        <?php 
            $sql=mysqli_query($con,"select * from stream");
            while($row=mysqli_fetch_array($sql)) {
        ?>
        <option value="<?php echo htmlentities($row['stream_id']);?>"><?php echo htmlentities($row['stream_name']);?></option>
        <?php } ?>
    </select> 
</div> 



 <button type="submit" name="submit" id="submit" class="btn btn-default">Generate Reports</button>
</form>
                            </div>
                            </div>
                    </div>
                  
                </div>

            </div>





        </div>
    </div>
  <?php include('includes/footer.php');?>
    <script src="../assets/js/jquery-1.11.1.js"></script>
    <script src="../assets/js/bootstrap.js"></script>


</body>
</html>
<?php } ?>
