# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Measure following file dimensions: apng, bmp, cur, gif, jpeg, ico, mng, pbm, pcx, pgm, png, ppm, psd, swf, tiff, xbm, xpm, webp"
HOMEPAGE="http://github.com/toy/image_size"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.55"

