# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="      Ruby Reports is a software library that aims to make the task of reporting
      less tedious and painful"
HOMEPAGE="http://rubyreports.org"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/fastercsv-0"
ruby_add_rdepend "=dev-ruby/pdf-writer-1.1.8"

