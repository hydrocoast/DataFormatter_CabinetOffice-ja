subroutine formatter(filename, nx, ny, arraydata)
    implicit none
    ! arguments
    character(*), intent(in) :: filename
    integer, intent(in) :: nx, ny
    real*8, intent(out) :: arraydata(ny,nx)
    ! local variables
    integer ::i,j

    ! read
    open(11, file=trim(filename), status='old', action='read')
    read(11,101) ((arraydata(i,j:j+9), j=1,nx,10), i=ny,1,-1)
    close(11)
101 format(10f8.2)
    return
end subroutine formatter

subroutine write_matrix(filename, nx, ny, arraydata)
    implicit none
    ! arguments
    character(*), intent(in) :: filename
    integer, intent(in) :: nx, ny
    real*8, intent(in) :: arraydata(ny,nx)
    ! local variables
    integer ::i,j

    ! write
    open(11, file=trim(filename), status='replace', action='write')
    write(11,101) (arraydata(i,:), i=1,ny)
    close(11)
101 format((<nx-1>(1pe14.6,","),1pe14.6)) !! only for ifort (Intel compiler)

    return
end subroutine write_matrix
