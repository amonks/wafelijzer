
module.exports = function(grunt) {

  // log to logs/grunt.log
  require('logfile-grunt')(grunt, { filePath: '../log/grunt.log' });
  // add timestamp to beginning of log
  grunt.log.write(getDateTime());

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    watch: {
      js: {
        files: ['../app/assets/js/*'],
        tasks: [
          'concat:js',
          'uglify:js'
        ]
      },
    },
    copy: {
      assets: {
        cwd: '../app/assets',
        src: ['*.js'],
        dest: '../public',
        expand: true
      }
    },
    clean: {
      build: {
        cwd: '../public',
        src: ["/assets"]
      }
    },
    concat: {
      js: {
        src: [
          '../app/assets/js/*'
        ],
        dest: '../public/js.js'
      }
    },
    uglify: {
      js: {
        files: {
          '../public/js.min.js': ['../public/js.js']
        }
      }
    },

  });
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.registerTask('default', [
    'clean:build',
    'concat:js',
    'uglify:js',
    'copy:assets',
  ]);
};


// function to generate timestamp
function getDateTime() {
  var now   = new Date();
  var year  = now.getFullYear();
  var month   = now.getMonth()+1;
  var day   = now.getDate();
  var hour  = now.getHours();
  var minute  = now.getMinutes();
  var second  = now.getSeconds();
  if(month.toString().length == 1) {
    var month = '0'+month;
  }
  if(day.toString().length == 1) {
    var day = '0'+day;
  }
  if(hour.toString().length == 1) {
    var hour = '0'+hour;
  }
  if(minute.toString().length == 1) {
    var minute = '0'+minute;
  }
  if(second.toString().length == 1) {
    var second = '0'+second;
  }
  var dateTime = year+'/'+month+'/'+day+' '+hour+':'+minute+':'+second;
  return dateTime;
}
